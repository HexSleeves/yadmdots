default: pull update

@pull:
    yadm fetch && \
      yadm reset --hard origin/master

@install:
    yadm bootstrap

@update:
    ~/.config/yadm/scripts/update.sh

@brew-dump:
    brew bundle dump --file ~/.Brewfile --global --describe --force

@brew-cleanup:
    brew bundle cleanup ~/.Brewfile --force --file
