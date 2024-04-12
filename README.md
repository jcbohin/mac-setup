# Mac Setup

These are configs to streamline my new/wiped mac setup and forget nothing important, getting ready in a few minutes, and installing and configuring my most used apps.

## Software install

Let's start with [Homebrew](https://brew.sh) :
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

*Note: [should try the pkg at some point](https://github.com/Homebrew/brew/releases/latest)*

Then, we download the [Brewfile](Brewfile) and run
```
brew bundle
```

## Config 

Download and copy files to `~` :
```
.config/
.gitconfig
```

## TODOS
- MacOS Settings
- Fonts
- fish advanced config
- iterm config
- 1password config (agent, ...)
- tampermonkey scripts
- neovim config (`set rtp+=/opt/homebrew/opt/fzf`)
