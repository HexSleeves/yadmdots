#!/bin/bash

# Enhanced script to monitor and kill CrowdStrike Falcon Agent
# WARNING: Only use this if you have proper authorization

# Default configuration
DEFAULT_PROCESS_NAME="com.crowdstrike.falcon.Agent"
DEFAULT_LOG_FILE="$HOME/falcon_killer.log"
DEFAULT_CHECK_INTERVAL=5
DEFAULT_KILL_SIGNAL=9 # SIGKILL
DEFAULT_PID_FILE="/tmp/falcon_killer.pid"

# Initialize variables with defaults
PROCESS_NAME="$DEFAULT_PROCESS_NAME"
LOG_FILE="$DEFAULT_LOG_FILE"
CHECK_INTERVAL="$DEFAULT_CHECK_INTERVAL"
KILL_SIGNAL="$DEFAULT_KILL_SIGNAL"
PID_FILE="$DEFAULT_PID_FILE"
DRY_RUN=false
VERBOSE=false
DAEMON=false

# Function to display help
show_help() {
	echo "Usage: $0 [OPTIONS]"
	echo "Monitor and kill CrowdStrike Falcon Agent processes"
	echo ""
	echo "Options:"
	echo "  -p, --process-name NAME    Process name to monitor (default: $DEFAULT_PROCESS_NAME)"
	echo "  -l, --log-file FILE        Log file location (default: $DEFAULT_LOG_FILE)"
	echo "  -i, --interval SECONDS     Check interval in seconds (default: $DEFAULT_CHECK_INTERVAL)"
	echo "  -s, --signal SIGNAL        Kill signal to use (default: $DEFAULT_KILL_SIGNAL)"
	echo "  -d, --daemon               Run as a daemon"
	echo "  -n, --dry-run              Only show what would be done without actually killing"
	echo "  -v, --verbose              Enable verbose output"
	echo "  -h, --help                 Display this help message"
	echo ""
	echo "Examples:"
	echo "  $0                         Run with default settings"
	echo "  $0 -i 10 -v                Check every 10 seconds with verbose output"
	echo "  $0 -n                      Dry run to see what would be killed"
	echo "  $0 -d                      Run as a daemon"
}

# Function to log messages
log_message() {
	local message="$1"
	local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
	echo "[$timestamp] $message" >>"$LOG_FILE"

	if [ "$VERBOSE" = true ]; then
		echo "[$timestamp] $message"
	fi
}

# Function to check if the script is already running
check_running() {
	if [ -f "$PID_FILE" ]; then
		local pid=$(cat "$PID_FILE")
		if ps -p "$pid" >/dev/null 2>&1; then
			echo "Script is already running with PID $pid"
			exit 1
		else
			# PID file exists but process is not running, remove stale PID file
			rm -f "$PID_FILE"
		fi
	fi
}

# Function to create PID file
create_pid_file() {
	echo $$ >"$PID_FILE"
	log_message "Started with PID $$"
}

# Function to clean up on exit
cleanup() {
	log_message "Stopping script"
	rm -f "$PID_FILE"
	exit 0
}

# Function to find and kill processes
kill_falcon() {
	# Find all processes matching the Falcon Agent
	local pids=$(pgrep -f "$PROCESS_NAME")

	if [ -n "$pids" ]; then
		log_message "Found Falcon Agent processes: $pids"

		if [ "$DRY_RUN" = true ]; then
			log_message "DRY RUN: Would kill processes: $pids with signal $KILL_SIGNAL"
			echo "DRY RUN: Would kill processes: $pids with signal $KILL_SIGNAL"
		else
			echo "$pids" | xargs kill -"$KILL_SIGNAL"
			log_message "Killed Falcon Agent processes with signal $KILL_SIGNAL"
			echo "Killed Falcon Agent processes at $(date)"
		fi
	else
		if [ "$VERBOSE" = true ]; then
			log_message "No Falcon Agent processes found"
		fi
	fi
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
	case "$1" in
	-p | --process-name)
		PROCESS_NAME="$2"
		shift 2
		;;
	-l | --log-file)
		LOG_FILE="$2"
		shift 2
		;;
	-i | --interval)
		CHECK_INTERVAL="$2"
		shift 2
		;;
	-s | --signal)
		KILL_SIGNAL="$2"
		shift 2
		;;
	-d | --daemon)
		DAEMON=true
		shift
		;;
	-n | --dry-run)
		DRY_RUN=true
		shift
		;;
	-v | --verbose)
		VERBOSE=true
		shift
		;;
	-h | --help)
		show_help
		exit 0
		;;
	*)
		echo "Unknown option: $1"
		show_help
		exit 1
		;;
	esac
done

# Check if the script is already running
check_running

# Create PID file
create_pid_file

# Set up signal handlers for graceful shutdown
trap cleanup SIGINT SIGTERM

# Create log file if it doesn't exist
touch "$LOG_FILE"

# Log script configuration
log_message "Starting Falcon Agent killer with configuration:"
log_message "  Process name: $PROCESS_NAME"
log_message "  Check interval: $CHECK_INTERVAL seconds"
log_message "  Kill signal: $KILL_SIGNAL"
log_message "  Dry run: $DRY_RUN"
log_message "  Verbose: $VERBOSE"

# If running as daemon, redirect output
if [ "$DAEMON" = true ]; then
	log_message "Running as daemon"
	# Fork the process
	(
		# Double fork to detach from terminal
		(
			# Initial kill
			kill_falcon

			# Monitor and kill continuously
			while true; do
				sleep "$CHECK_INTERVAL"

				if pgrep -f "$PROCESS_NAME" >/dev/null; then
					kill_falcon
				fi
			done
		) &
		disown
	) &
	exit 0
else
	# Initial kill
	kill_falcon

	# Monitor and kill continuously
	while true; do
		sleep "$CHECK_INTERVAL"

		if pgrep -f "$PROCESS_NAME" >/dev/null; then
			kill_falcon
		fi
	done
fi
