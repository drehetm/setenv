# setenv
This repo contains `local environment settings` for software development (and not only).

## Setup 'localhost - MacOS'
### 0 - Create `configs/zsh/setenv_cfg.zsh` and define _required_ environment variables there. See below example for my working laptop:
```zsh
# Absolute path to the 'setenv' github repository
export SETENV_REPO_PATH="/Users/drehetm/go/src/github.com/drehetm/setenv"
```

### 1 - Setup `Hyper Key` through `Karabiner-Elements`
It is needed for `Homerow`, see it's [github page](https://github.com/nchudleigh/homerow?tab=readme-ov-file#pro-tip-map-caps-lock-to-hyper-key).
```zsh
brew install karabiner-elements
```

### 2 - Install `Homerow` through `Homebrew`
```zsh
brew install homerow
```

### 3 - Install better terminal (sploiler: `iTerm2`) using `Homebrew`
> [!IMPORTANT]
> Do not forget to turn off `iTerm2` auto-update feature.
```zsh
brew install iterm2
```

### 4 - Manually setup `iTerm2`
Setup steps are described [here](configs/iterm2/README.md).

### 5 - Open `iTerm2` and run automatic setup script `./setup.zsh`
> [!TIP]
> Choose option `a` to setup all. If something fails follow the error message instructions to fix it.

### 6 - Install all applications which have configs in the `./configs` directory of the `setenv` (current one) repository
```zsh
brew update
brew install go python pyenv autoenv
```

### 7 - Perform step #5 above to apply all configs for the installed tools

### 8 - Restart your macbook to be sure that everything is applied correctly

