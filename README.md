# dev
Setting up development environment.

## Installation
### Iterm2
```bash
cd iterm2
sh install.sh
```

### Tmux
```bash
cd tmux
sh install.sh
```

Open clipboard access in `Setting->General->Selection->Applications in terminal may access clipboard`.

### Neovim
```bash
cd nvim
sh install.sh
```

## Usage

### Tmux
```
tmux [new -s <session-name> -n <window-name>]        # 打开一个 session，-d 表示不 attach
tmux ls                                              # 列出 session
tmux at -t myname  (or a, or attach)                 # attach session
tmux show -g                                         # 导出配置
tmux kill-session -t <session-name>                  # 关闭 session
tmux kill-pane/kill-window/kill-session/kill-server  # kill
```

#### Key bindings
```
:new[ -s session-name]<CR> # 创建新的 Session，其中 : 是进入 Tmux 命令行的快捷键，<CR>表示回车
```

`prefix` 指的是tmux的前缀键，所有tmux快捷键都需要先按前缀键。它的默认值是`Ctrl+b`。这里配置的是 `Ctrl+x`。
```
s        # 列出所有 Session，可通过 j, k, 回车切换
$        # 为当前 Session 命名

c        # 创建 Window
<n>      # 切换到第 n 个 Window
,        # 为当前 Window 命名
.        # 修改当前窗口编号（适用于窗口重新排序）
p        # 切换至上一窗口
n        # 切换至下一窗口
w        # 窗口列表选择，j, k, 回车切换
&        # 关闭当前窗口
z        # zoom, 全屏/恢复面板窗口
f        # 快速定位到窗口（输入关键字匹配窗口名称

%        # 垂直切分 Pane
"        # 水平切分 Pane
<space>  # 切换 Pane 布局
d        # detach，退出 Tmux Session，回到父级 Shell
t        # 显示一个时钟，:)
?        # 快捷键帮助列表
{        # 向前置换当前面板
}        # 向后置换当前面板
```
- Save and restore
[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
> Press `<leader>` first
```
Ctrl-s  # save session
Ctrl-r  # restore session
```
- Plugin manager
[tpm](https://github.com/tmux-plugins/tpm)
> Press `<leader>` first
```
I        # Install
U        # Uninstall
alt + u  # Remove/uninstall plugins not on the plugin list
```

### Neovim

```bash
alias vim="nvim"
alias vi="nvim"
```

#### Functions

`<leader>` means vim-leader. We config `,` as `<leader>` here.(`vim.g.mapleader = ","`)

- Directory tree([nvim-tree](https://github.com/nvim-tree/nvim-tree.lua))
```
<leader>t  # 打开 tree，同 `:NvimTreeToggle`

g?         # help
i          # horizontal split
v          # vertical split
P          # parent directory
p          # paste
c          # copy
x          # cut
r          # rename
R          # refresh
E          # expand all，展开
W          # collapse，折叠
y          # copy name
Y          # copy relative path
gy         # Copy absolute path
<Tab>      # preview
d          # delete
D          # trash
```

- Tab manager([barbar](https://github.com/romgrk/barbar.nvim))

> All in normal mode
```
-- Move to previous/next
<A-,>  # `:BufferPrevious<CR>', move to previous
<A-.>  # `:BufferNext<CR>', move to next

-- Re-order to previous/next
<A-<>  # `:BufferMovePrevious<CR>'
<A->>  # `:BufferMoveNext<CR>'

-- Goto buffer in position...
<A-1>  # `:BufferGoto 1<CR>`
<A-2>  # `:BufferGoto 2<CR>`
<A-3>  # `:BufferGoto 3<CR>`
<A-4>  # `:BufferGoto 4<CR>`
<A-5>  # `:BufferGoto 5<CR>`
<A-6>  # `:BufferGoto 6<CR>`
<A-7>  # `:BufferGoto 7<CR>`
<A-8>  # `:BufferGoto 8<CR>`
<A-9>  # `:BufferGoto 9<CR>`
<A-0>  # `:BufferLast<CR>`

-- Pin/unpin buffer
<A-p>  # `:BufferPin<CR>`

-- Close buffer
'<A-c>'  # `:BufferClose<CR>`

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
<A-P>  # `:BufferPick<CR>`

-- Sort automatically by...
<Space>bb  # `:BufferOrderByBufferNumber<CR>`
<Space>bd  # `:BufferOrderByDirectory<CR>`
<Space>bl  # `:BufferOrderByLanguage<CR>`
<Space>bw  # `:BufferOrderByWindowNumber<CR>`
```

- Fuzzy finder([telescope](https://github.com/nvim-telescope/telescope.nvim))
```
<leader>ff  # Find files，同  `:Telescope find_files<cr>`
<leader>fg  # Live grep，同 `:Telescope live_grep<cr>`
<leader>fb  # Buffers，同 `:Telescope buffers<cr>`
<leader>fh  # Help tags，同 `:Telescope help_tags<cr>`
```

- Terminal interaction([toggleterm](https://github.com/akinsho/toggleterm.nvim))
```
<C-\>                 # 打开一个 terminal window，同 `:ToggleTerm`
<Esc>                 # 从 Terminal 模式回到 Normal 模式，同 `<C-\><C-N>`
Normal 模式下 2<C-\>  # Open multiple terminal side-by-side
```
- Git interaction([vim-fugitive](https://github.com/tpope/vim-fugitive))
```
`:Git commit`, `:Git rebase -i` and other commands  # invoke an editor do their editing in the current Vim instance.
`:Git diff`, `:Git log` and verbose                 # have their output loaded into a temporary buffer
`:Git mergetool` and `:Git difftool`                # load their changesets into the quickfix list
`:Git`                                              # opens a summary window with dirty files and unpushed and unpulled commits. 
                                                    # Press `g?` to bring up a list of maps for numerous operations including diffing, staging, committing, rebasing, and stashing.
`:Gedit`                                            # // TODO
`:Gdiffsplit` or `:Gdiffvsplit`                     # // TODO
`:Gread`                                            # // TODO
```

- LSP(Language Server Protocol)([mason](https://github.com/williamboman/mason.nvim))
```
gD         # go to declaration
gd         # go to definition
gh         # go to hover
gi         # go to implementation
gr         # go to references
<space>f   # code format
<space>rn  # code rename
<space>ca  # code action
```

- Code completion([YouCompleteMe](https://github.com/ycm-core/YouCompleteMe))
```
<A-b>  # doc scroll backward
<A-f>  # doc scroll forward
<A-j>  # items down
<A-k>  # items up
<CR>   # confirm selection
```

- Plugin manager([packer](https://github.com/wbthomason/packer.nvim))
```
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Show list of installed plugins
:PackerStatus

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
```
