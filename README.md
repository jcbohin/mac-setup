# Mac Setup

These are configs to streamline my new/wiped mac setup and forget nothing important, getting ready in a few minutes, and installing and configuring my most used apps.

## Software 

### Install

Let's start with [Homebrew](https://brew.sh) :
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

*Note: [should try the pkg at some point](https://github.com/Homebrew/brew/releases/latest)*

Then, we download the [Brewfile](Brewfile) and run
```
brew bundle
```

### Apps Config 

Download and copy files to `~` :
```
.config/
.gitconfig
```

## MacOS config

```
# Dock
defaults write com.apple.dock "orientation" -string "left" && killall Dock # Put the Dock on the left of the screen
defaults write com.apple.dock "tilesize" -int "36" && killall Dock # Dock icon size of 36 pixels
defaults write com.apple.dock "scroll-to-open" -bool "true" && killall Dock # Scroll up on a Dock icon to show all Space's opened windows for an app, or open stack

# Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder # Show all file extensions inside the Finder
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder # Show path bar
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv" && killall Finder # default view style as column
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder # keep folders on top
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" && killall Finder # Default search scope is the current folder
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" && killall Finder # Automatically empty bin after 30 days
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "true" # iCloud Documents is the default directory opened in the fileviewer dialog when saving a new document
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true" && killall Finder # Show icon in the title bar

defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true" # When a new disk is connected, system does not prompt to ask if you want to use it as a backup volume

# Menubar
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm\"" # Set time format

# Keyboard
defaults write com.apple.HIToolbox AppleFnUsageType -int "2" # When you press the Fn or 🌐︎ key, opens the Character Viewer for entering emoji, symbols, and more
defaults write com.apple.TextEdit "SmartQuotes" -bool "false" && killall TextEdit # Disable smart quotes

# Mission Control
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock # Keep the Spaces arrangement (not on most recent use)
defaults write com.apple.dock "expose-group-apps" -bool "true" && killall Dock # Group windows by application.

# Feedback Assistant
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false" #  Do not autogather large files when submitting a report

```

## TODOS
- lunarvim
- macwhisper
- uv
- endel
- bear
- ghostty
- fish advanced config
- 1password config (agent, ...)
- tampermonkey scripts
- neovim config (`set rtp+=/opt/homebrew/opt/fzf`)
- Jan & alternatives ?
- Use Nix (https://nixos.org/download/) ?
- ZelliJ ?
- Btop ? https://github.com/aristocratos/btop
- Ghostty
- iterm config => deprecated with ghostty
- tailscale ?
- vscode ?
- obsidian
- cursor ? Zed ?
- kagi search
- pika
- raycast ?
- stopthemadness
- reeder
- Orion browser