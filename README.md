# dotfiles

# 1. Troubleshooting

## 1.1. Vim has gray background in the solarized mode

There are many options to solve it: terminal or .vimrc. But in many cases it was caused by the default terminal settings.

- Terminal: configure the **terminal** settings: change the integrated scheme and color palettes to '**solarized**'.

- .vimrc: try the following settings if terminal settings do not help. 

```
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
```
