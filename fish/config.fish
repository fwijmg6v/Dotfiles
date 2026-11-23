# ==========================================
# 1. ENVIRONMENT & INITIALIZATION
# ==========================================

# Disable the default interactive greeting
set -g fish_greeting ""

# Ensure interactive session settings
if status is-interactive
    # Set default editor
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end


# ==========================================
# 2. SYNTAX HIGHLIGHTING (Light Blue & Ink Black)
# ==========================================

# Base Text & Primary Command
set -g fish_color_normal E6F0FA
set -g fish_color_command BCE3FF --bold
set -g fish_color_keyword B5D6F5 --bold

# Arguments, Options & Variables
set -g fish_color_param A3B8CC
set -g fish_color_option A0B8D0
set -g fish_color_quote BCE3FF
set -g fish_color_redirection E6F0FA

# Interactive Selections & Autocompletions
set -g fish_color_autosuggestion 6E7A8A
set -g fish_color_selection --background=161B22 BCE3FF
set -g fish_color_search_match --background=161B22 BCE3FF

# Completion Pager Colors
set -g fish_pager_color_prefix BCE3FF --bold
set -g fish_pager_color_completion E6F0FA
set -g fish_pager_color_description A3B8CC
set -g fish_pager_color_progress 7D8B99 --background=090A0F

# Errors & Statements
set -g fish_color_error FF6B7E
set -g fish_color_operator BCE3FF
set -g fish_color_escape BCE3FF
set -g fish_color_comment 6E7A8A


# ==========================================
# 3. HELPFUL ALIASES & FUNCTIONS
# ==========================================

# Modern Replacements (eza, bat, zoxide)
if command -q eza
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -lh --icons --group-directories-first"
    alias la="eza -lah --icons --group-directories-first"
    alias tree="eza --tree --icons"
else
    alias ls="ls --color=auto"
    alias ll="ls -lh"
    alias la="ls -lah"
end

if command -q bat
    alias cat="bat --paging=never"
end

# Navigation & Dotfiles Shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias hypr="nvim ~/.config/hypr/hyprland.lua"
alias ghostty-config="nvim ~/.config/ghostty/config"
alias fish-config="nvim ~/.config/fish/config.fish"

# Sync fn: make DEST an exact copy of SRC (deletes what SRC doesn't have).
# Guards: exactly 2 non-empty args, SRC must be a dir, refuses / and top-level
# dirs, $HOME and its parents, and SRC/DEST that are equal or nested.
# Always previews (dry run) and asks; answering no = the old showcase.
function mirror_dir --description 'Mirror SRC into DEST (rsync --delete) after a preview'
    if test (count $argv) -ne 2; or test -z "$argv[1]"; or test -z "$argv[2]"
        echo "usage: mirror_dir SRC DEST   (DEST becomes an exact copy of SRC)" >&2
        return 2
    end
    if not test -d "$argv[1]"
        echo "mirror_dir: source '$argv[1]' is not a directory" >&2
        return 1
    end
    set -l src (path resolve -- $argv[1])
    set -l dst (path resolve -- $argv[2])

    if test (count (string split -n / -- $dst)) -lt 2 # /, /etc, /home, /mnt ...
        or string match -q -- "$dst/*" "$HOME/" # $HOME or a parent of it
        or string match -q -- "$dst/*" "$src/" # DEST is SRC or contains it
        or string match -q -- "$src/*" "$dst/" # DEST is inside SRC
        echo "mirror_dir: refusing to mirror into '$dst'" >&2
        return 1
    end

    set -l plan (rsync -a --delete --dry-run --itemize-changes -- "$src/" "$dst/")
    or return
    if not set -q plan[1]
        echo "Already in sync: $dst"
        return 0
    end
    set -l dels (string replace -rf '^\*deleting\s+' '' -- $plan)
    echo "$src/  ->  $dst/"
    echo (math (count $plan) - (count $dels))" to copy/update, "(count $dels)" to DELETE"
    if set -q dels[1]
        printf '  - %s\n' $dels | head -n 20
        test (count $dels) -gt 20; and echo "  ... and "(math (count $dels) - 20)" more"
    end

    read -l -P "Mirror now? [y/N] " answer
    string match -qir -- '^y(es)?$' "$answer"; or return 1
    rsync -avh --delete -- "$src/" "$dst/"
end

# ==========================================
# 4. PROMPT INTEGRATION (Starship / Zoxide)
# ==========================================

# Initialize Zoxide (smart cd) if installed
if command -q zoxide
    zoxide init fish | source
end

# Initialize Starship prompt if installed
if command -q starship
    starship init fish | source
end

# Created by `pipx` on 2026-09-17 15:09:40
set PATH $PATH /home/samu/.local/bin
