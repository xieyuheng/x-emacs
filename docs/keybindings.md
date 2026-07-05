# Key Bindings

### Files

| Key    | Description                 | Function                    | Default Command                   |
|-----------|----------------------|-------------------------|----------------------------|
| `C-x C-s` | Save, show filename summary | `x-save-buffer`         | `save-buffer`              |
| `C-s C-x` | Save (Alternate)       | `x-save-buffer`         | —                         |
| `C-x k`   | Kill current buffer      | `x-kill-current-buffer` | `kill-buffer`              |
| `C-x C-h` | Select all                 | `mark-whole-buffer`     | `describe-prefix-bindings` |

### Windows / Navigation

| Key    | Description        | Function                 | Default Command    |
|-----------|-------------|----------------------|-------------|
| `C-o`     | Next window    | `(other-window +1)`  | `open-line` |
| `C-.`     | Next buffer | `next-buffer`        | —          |
| `C-,`     | Previous buffer | `previous-buffer`    | —          |
| `M-p`     | Previous paragraph    | `backward-paragraph` | —          |
| `M-n`     | Next paragraph    | `forward-paragraph`  | —          |
| `<prior>` | Scroll up 1 line   | `(scroll-down 1)`    | Half page up    |
| `<next>`  | Scroll down 1 line   | `(scroll-up 1)`      | Half page down    |

### Search / Replace

| Key         | Description           | Function                     | Default Command          |
|----------------|----------------|--------------------------|-------------------|
| `C-t`          | Incremental search       | `isearch-forward`        | `transpose-chars` |
| `C-t` (in search) | Continue search forward | `isearch-repeat-forward` | —                |
| `M-i`          | Query replace       | `query-replace`          | `tab-to-tab-stop` |

### Editing

| Key   | Description                 | Function                     | Default Command            |
|----------|----------------------|--------------------------|---------------------|
| `C-;`    | Toggle comment/uncomment | `x-toggle-comment`       | —                  |
| `C-M-u`  | Fill paragraph             | `fill-region`            | `backward-up-list`  |
| `C-M-y`  | Paste from clipboard       | `x-paste-from-clipboard` | `yank-pop`          |
| `C-M-g`  | Toggle line truncation        | `toggle-truncate-lines`  | —                  |
| `C-M-w`  | Cleanup whitespace         | `whitespace-cleanup`     | `append-next-kill`  |
| `C-h`    | Smart completion             | `hippie-expand`          | `help-command` prefix |
| `<C-f1>` | Convert to kebab-case at cursor  | `x-convert-to-kebab`     | —                  |
| `<C-f2>` | Convert to snake_case at cursor  | `x-convert-to-snake`     | —                  |

### C-s Prefix Keys

| Key    | Description                  | Function             | Default Command                          |
|-----------|-----------------------|------------------|-----------------------------------|
| `C-s`     | Custom prefix keymap          | anonymous keymap | `isearch-forward`(moved to `C-t`) |
| `C-s C-c` | Clone frame            | `clone-frame`    | —                                |
| `C-s C-j` | Jump to file:line:column | `x-jump-to-file` | —                                |

| Key    | First press (global)       | Second press (local override)       |
|-----------|----------------------|----------------------------|
| `C-s C-e` | Open eshell          | In eshell: return to previous buffer |
| `C-s C-s` | Edit markdown code block | In edit-indirect: submit & return |
| `C-s C-w` | Open ranger          | In ranger: return to original window      |

### Brackets / S-Expressions

| Key        | Description              | Function                          | Default Command                         |
|---------------|-------------------|-------------------------------|----------------------------------|
| `M-[`         | Cycle brackets () [] {} | `x-cycle-brackets`            | `backward-paragraph`             |
| `M-a`         | mark-sexp         | `mark-sexp`                   | `backward-sentence`              |
| `M-e`         | backward-sexp     | `backward-sexp`               | `forward-sentence`               |
| `M-s`         | forward-sexp      | `forward-sexp`                | `center-line`                    |
| `M-q`         | backward-up-list  | `backward-up-list`            | `fill-paragraph`                 |
| `M-r`         | raise-sexp        | `paredit-raise-sexp`          | `move-to-window-line-top-bottom` |
| `M-c`         | splice-sexp       | `paredit-splice-sexp`         | `capitalize-word`                |
| `M-"`         | Add double quotes          | `paredit-meta-doublequote`    | —                               |
| `C-M-9`       | Wrap with parentheses        | `paredit-wrap-round`          | —                               |
| `<C-right>`   | Slurp forward            | `paredit-forward-slurp-sexp`  | `right-word`                     |
| `<C-left>`    | Barf forward            | `paredit-forward-barf-sexp`   | `left-word`                      |
| `<C-M-right>` | Barf backward            | `paredit-backward-barf-sexp`  | —                               |
| `<C-M-left>`  | Slurp backward            | `paredit-backward-slurp-sexp` | —                               |

Unbound in paredit: `C-j` `<RET>` `C-M-u` `C-M-d` `C-M-p` `C-M-n` `;`

### Unbound Keys

| Key       | Default Command                  |
|--------------|---------------------------|
| `M-t`        | `transpose-words`         |
| `M-j`        | `indent-new-comment-line` |
| `M-k`        | `kill-sentence`           |
| `` M-` ``    | `tmm-menubar`             |
| All mouse events | Various                      |
