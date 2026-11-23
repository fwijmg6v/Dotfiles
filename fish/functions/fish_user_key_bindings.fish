# Vi mode with the Graphite remaps from nvim/lua/config/keymaps.lua:
# movement on y h a e (the QWERTY hjkl spot), append on n (mirrors i),
# and what those displace moves to j k l. Everything else stays vi.
#
# fish runs this after the vi preset loads (fish_key_bindings is set in
# config.fish). Preset commands copied from fish 4.9.3's
# share/functions/fish_vi_key_bindings.fish.
function fish_user_key_bindings
    # The preset has multi-key sequences starting with y (yank), and d/c
    # followed by a (around). Left in place, "y then i" would yank instead
    # of left + insert, and "d then a" would wait for an "around" object.
    for seq in y,\$ y,\^ y,0 y,i,w y,i,W y,a,w y,a,W y,i,b y,a,b y,i y,a \
            d,a,w d,a,W d,a,b d,a c,a,w c,a,W c,a,b c,a
        bind --preset --erase -M default $seq
    end

    # --- movement: y h a e = left down up right ---
    bind -M default y 'fish_vi_run_count backward-char'
    bind -M default h 'fish_vi_run_count down-or-search'
    bind -M default a 'fish_vi_run_count up-or-search'
    bind -M default e 'fish_vi_run_count forward-char'

    bind -M visual y backward-char
    bind -M visual h down-line
    bind -M visual a up-line
    bind -M visual e forward-char

    # after d / c / j(yank): dh = 2 lines down, dy = 1 char left, ...
    bind -M operator y 'fish_vi_exec_motion backward-char'
    bind -M operator h 'fish_vi_exec_motion down-line'
    bind -M operator a 'fish_vi_exec_motion up-line'
    bind -M operator e 'fish_vi_exec_motion forward-char'

    # --- j = yank (jj = yank line, J = yank to end) ---
    bind -M default j 'fish_vi_start_operator yank'
    bind -M operator j 'fish_vi_exec_motion --linewise'
    bind -M default J kill-line yank
    bind -M visual -m default j fish_vi_yank_selection end-selection repaint-mode
    bind '",+,j,j' fish_clipboard_copy
    bind -M visual -m default '",+,j' "fish_clipboard_copy; commandline -f end-selection repaint-mode"

    # --- k = next match: walks history matching what's typed; K goes back ---
    # (the preset k already does up-or-search)
    bind -M default K 'fish_vi_run_count down-or-search'

    # --- l = end of word/WORD ---
    bind -M default l 'fish_vi_run_count forward-word-end'
    bind -M default L 'fish_vi_run_count forward-bigword-end'
    bind -M visual l forward-word-end
    bind -M visual L forward-bigword-end
    bind -M operator l 'fish_vi_exec_motion forward-word-end'
    bind -M operator L 'fish_vi_exec_motion forward-bigword-end'

    # --- n = append, N = append at end of line ---
    bind -M default -m insert n 'set fish_cursor_end_mode exclusive' forward-single-char repaint-mode
    bind -M default -m insert N 'set fish_cursor_end_mode exclusive' end-of-line repaint-mode

    # --- shifted movement keys do what shifted hjkl did ---
    bind -M default H end-of-line delete-char # join lines
    bind -M default A 'man (commandline -t) 2>/dev/null; or echo -n \a' # docs for word under cursor

    # --- ctrl-k = increment (nvim moved it off ctrl-a; ctrl-x still decrements) ---
    bind -M default ctrl-k fish_vi_inc

    # --- text objects: i = inner as usual, n = around (dnw, cn", jib) ---
    bind -M default d,n,w kill-a-word
    bind -M default d,n,W kill-a-bigword
    bind -M default d,n,b jump-to-matching-bracket and jump-to-matching-bracket and begin-selection jump-to-matching-bracket kill-selection end-selection
    bind -M default d,n backward-jump and repeat-jump-reverse and begin-selection repeat-jump kill-selection end-selection

    bind -M default -m insert c,n,w kill-a-word repaint-mode
    bind -M default -m insert c,n,W kill-a-bigword repaint-mode
    bind -M default -m insert c,n,b jump-to-matching-bracket and jump-to-matching-bracket and begin-selection jump-to-matching-bracket kill-selection end-selection
    bind -M default -m insert c,n backward-jump and repeat-jump-reverse and begin-selection repeat-jump kill-selection end-selection repaint-mode

    bind -M default j,\$ kill-line yank
    bind -M default j,\^ backward-kill-line yank
    bind -M default j,0 backward-kill-line yank
    bind -M default j,i,w kill-inner-word yank
    bind -M default j,i,W kill-inner-bigword yank
    bind -M default j,n,w kill-a-word yank
    bind -M default j,n,W kill-a-bigword yank
    bind -M default j,i,b jump-till-matching-bracket and jump-till-matching-bracket and begin-selection jump-till-matching-bracket fish_vi_yank_selection end-selection
    bind -M default j,n,b jump-to-matching-bracket and jump-to-matching-bracket and begin-selection jump-to-matching-bracket fish_vi_yank_selection end-selection
    bind -M default j,i backward-jump-till and repeat-jump-reverse and begin-selection repeat-jump fish_vi_yank_selection end-selection
    bind -M default j,n backward-jump and repeat-jump-reverse and begin-selection repeat-jump fish_vi_yank_selection end-selection
end
