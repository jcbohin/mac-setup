# CLAUDE.md - AI Assistant Guide for mac-setup Repository

## Repository Overview

This is a personal Mac setup automation repository designed to streamline new/wiped Mac setup with minimal effort. The repository contains configuration files, package lists, and system preferences to quickly restore a productive development environment.

**Primary Purpose**: Automate Mac setup, application installation, and configuration in minutes
**Target Platform**: macOS (currently tested on latest versions)
**Management Tool**: Homebrew for package management

## Repository Structure

```
mac-setup/
├── Brewfile                    # Homebrew bundle file (packages, apps, fonts)
├── README.md                   # User-facing setup instructions and TODOs
├── .gitconfig                  # Git configuration (difftastic, delta)
└── .config/                    # Application configurations
    ├── fish/                   # Fish shell configuration
    │   ├── config.fish        # Shell init with starship, fzf, zoxide, atuin
    │   └── fish_variables     # Fish internal variables
    ├── wezterm/                # WezTerm terminal config (legacy, see note)
    │   ├── wezterm.lua        # Main WezTerm configuration
    │   └── appearance.lua     # Theme/appearance settings
    └── 1Password/              # 1Password SSH agent configuration
        └── ssh/agent.toml     # SSH key vault settings
```

## Key Files and Their Purposes

### Brewfile (119 lines)
The central package manifest containing:
- **Taps**: Custom Homebrew repositories (homebrew/bundle, buo/cask-upgrade)
- **CLI Tools**: Shell tools (fish, starship), dev tools (neovim, git, lazygit), modern replacements (bat, procs, ripgrep, fzf)
- **Applications**: Productivity (1Password, Obsidian, Typora), dev tools (VSCode, Zed, GitKraken), utilities (IINA, Numi, Pika)
- **Fonts**: Nerd Fonts collection (FiraCode, 0xProto, Anonymice, Hack)
- **Mac App Store Apps**: Safari extensions, Microsoft Office, communication apps (Slack, WhatsApp, Signal)

**Important Notes**:
- Some entries have comments indicating deprecated/replaced tools (e.g., WezTerm → Ghostty)
- Duplicate entries exist (visual-studio-code appears twice at lines 94 and 111)
- Mixed language comments (English and French)

### .gitconfig (29 lines)
Git configuration emphasizing better diff tools:
- **diff.tool**: difftastic for structural diffs
- **core.pager**: delta for better diff viewing
- **merge.conflictstyle**: diff3 for showing common ancestor in conflicts

### .config/fish/config.fish (8 lines)
Minimal Fish shell initialization loading:
- **starship**: Modern, customizable shell prompt
- **fzf**: Fuzzy finder for command history and file navigation
- **zoxide**: Smart cd replacement (learns common directories)
- **atuin**: Enhanced shell history with sync capabilities

### .config/wezterm/wezterm.lua (42 lines)
Terminal configuration (NOTE: Repository is transitioning to Ghostty):
- Default shell: Fish at `/opt/homebrew/bin/fish`
- Color scheme: Tokyo Night
- Font: FiraCode Nerd Font Mono, size 12
- Window: 90% opacity, 30pt blur, integrated decorations

## Development Workflows

### Adding New Software

1. **CLI Tools/Applications**: Add to Brewfile in appropriate section
   - Use `brew "package-name"` for CLI tools
   - Use `cask "app-name"` for GUI applications
   - Use `mas "App Name", id: 123456` for Mac App Store apps

2. **Configuration Files**: Place in `.config/` directory matching XDG structure
   - Fish shell: `.config/fish/`
   - Terminal: `.config/wezterm/` or `.config/ghostty/` (migration in progress)
   - SSH: `.config/1Password/ssh/`

3. **Git Configuration**: Update `.gitconfig` for git-related changes

### Updating the Repository

**After modifying local configs**:
```bash
# Copy updated configs from home directory
cp ~/.config/fish/config.fish .config/fish/
cp ~/.gitconfig .gitconfig
# Commit changes with descriptive message
git commit -m "Update fish config: add new aliases"
```

**When adding software**:
```bash
# Generate current Brewfile from system
brew bundle dump --force
# Review changes, commit
git commit -m "Add new packages: <package-names>"
```

### Setup on New Mac

**Complete workflow** (as documented in README.md):
```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone repository and install packages
git clone <repo-url> ~/mac-setup
cd ~/mac-setup
brew bundle

# 3. Copy configurations
cp -r .config ~/
cp .gitconfig ~/

# 4. Apply macOS defaults (see README.md for full list)
# Example: defaults write com.apple.dock "orientation" -string "left" && killall Dock
```

## Key Conventions for AI Assistants

### File Modifications

1. **Brewfile Updates**:
   - Maintain sectional organization (shell, fonts, applications, etc.)
   - Preserve existing comments explaining choices
   - Note deprecated packages with inline comments
   - Check for duplicates before adding (visual-studio-code currently duplicated)
   - Keep language consistency (prefer English for new entries)

2. **Configuration Files**:
   - Preserve exact indentation (Lua uses tabs, Fish uses spaces)
   - Test configurations are valid before committing
   - Document non-obvious settings with inline comments
   - Respect XDG Base Directory specification for `.config/`

3. **README.md**:
   - Keep TODOs section updated when implementing items
   - Add new setup steps to appropriate sections
   - Maintain code block formatting for commands
   - Document any manual steps that can't be automated

### Git Practices

- **Commit Messages**: Use conventional format: "Add X", "Update Y", "Remove Z"
- **Branch Strategy**: Main branch contains stable configurations
- **File Tracking**: Only track essential configs, not generated/cache files
- **Sensitive Data**: Never commit API keys, tokens, or personal credentials

### Code Style

**Lua (WezTerm/Ghostty configs)**:
- Use snake_case for variables: `local config = wezterm.config_builder()`
- Tab indentation
- Comment complex configurations
- Return config object at end

**Fish (Shell config)**:
- One command per line for clarity
- Use `if status is-interactive` guard for interactive-only commands
- Source order matters: load prompt (starship) before tools

**Brewfile**:
- Group by category with section comments
- Alphabetize within sections for easy scanning
- Include helpful comments for non-obvious packages
- Format: `brew "name" # description` or `cask "name"`

### Common Tasks

**Adding a new CLI tool**:
```ruby
# In Brewfile, find appropriate section (e.g., "# shell tools")
brew "tool-name" # Brief description of what it does
```

**Adding a new application**:
```ruby
# In Brewfile, Applications section
cask "app-name" # Brief description
# OR for Mac App Store:
mas "App Name", id: 123456 # Brief description
```

**Adding shell configuration**:
```fish
# In .config/fish/config.fish
if status is-interactive
    # New configuration here
end
```

**Adding macOS defaults command**:
```bash
# In README.md, MacOS config section with explanation
defaults write domain "key" -type "value" && killall App # Description
```

### Known Issues and TODOs

Current TODOs from README.md (lines 65-78):
- [ ] fish advanced config
- [ ] 1password config (agent, ...)
- [ ] tampermonkey scripts
- [ ] neovim config (`set rtp+=/opt/homebrew/opt/fzf`)
- [ ] Jan & alternatives evaluation
- [ ] Consider Nix package manager migration
- [ ] m-cli integration (https://github.com/rgcr/m-cli)
- [ ] ampcode evaluation
- [ ] lazyvim setup
- [ ] Bear notes setup
- [ ] lm-studio evaluation

**Migration in Progress**:
- WezTerm → Ghostty (Brewfile line 74 indicates WezTerm replaced by Ghostty, but WezTerm configs still present)

### Testing Changes

**Before committing**:
1. Validate Brewfile syntax: `brew bundle check`
2. Test shell config: `fish -c "source .config/fish/config.fish"`
3. Verify git config: `git config --list --file=.gitconfig`
4. Check for sensitive data: `git diff --staged`

### Repository Philosophy

**Design Principles**:
- Declarative over imperative: Use Brewfile rather than install scripts
- Version controlled configs: All configurations in git for history/rollback
- Minimal manual steps: Automate everything possible
- Documentation inline: README.md contains runnable commands, not just descriptions
- Idempotent operations: Can re-run setup without breaking existing setup

**What NOT to commit**:
- Cache files (fish_history, .DS_Store)
- Personal tokens/credentials
- Large binary files
- System-specific paths (use ~ or $HOME instead)

## Recent Changes

**Last 5 commits** (git log):
1. `90c54ad` - Update packages
2. `1e85d95` - Adds m-cli to todo
3. `1b68082` - Adding more apps to the todo
4. `d1a7889` - update todo also, fix typo
5. `36e3a25` - Configure wezterm

**Change velocity**: Active development with focus on expanding package list and TODO refinement

## Quick Reference for AI Assistants

**Most common requests**:
1. "Add package X" → Update Brewfile in appropriate section
2. "Configure Y for Fish" → Edit `.config/fish/config.fish`
3. "Add macOS setting" → Add to README.md MacOS config section
4. "Update TODO" → Edit README.md TODOS section
5. "Clean up Brewfile" → Remove duplicates, organize sections, update deprecated packages

**File locations** (case-sensitive):
- Package manifest: `./Brewfile`
- Setup guide: `./README.md`
- Git settings: `./.gitconfig`
- Shell config: `./.config/fish/config.fish`
- Terminal config: `./.config/wezterm/wezterm.lua` (legacy)

**Key tools used**:
- Package manager: Homebrew (`brew`)
- Shell: Fish with Starship prompt
- Terminal: Ghostty (migration from WezTerm in progress)
- Editor: Neovim, VSCode, Zed
- Git diff: Difftastic + Delta
- Password manager: 1Password (with SSH agent)

---

*This CLAUDE.md was generated on 2025-11-15. Update when major structural changes occur.*
