# dotfiles

## Vim

- [vim-plug](https://github.com/junegunn/vim-plug)
- [coc](https://github.com/neoclide/coc.nvim)
- [coc extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions)
	- `coc-css`
	- `coc-cmake`
	- `coc-emmet`
	- `coc-go`: requires [gopls](https://github.com/golang/tools/tree/master/gopls)
	- `coc-html`
	- `coc-yaml`
  - `coc-sh`
  - `coc-json`
  - `coc-docker`: requires [dockerfile-language-server](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
- [vim-hclfmt](https://github.com/fatih/vim-hclfmt)
- hclfmt: `go get github.com/fatih/hclfmt`
- [powerline compatible fonts](https://powerline.readthedocs.io/en/master/installation/linux.html#fonts-installation)
  - clone the repository with the patched fonts
  - run the install script from the repository
  - reload the font-cache
    - `fc-cache -vf ~/.local/share/fonts`
    - `fc-cache -vf`
  - restart the ternimal and set the font

## Tmux

- [different vim colors in tmux](https://unix.stackexchange.com/a/363374)
- [vim key bindings](https://stackoverflow.com/a/24302869)
- [tpm (plugin manager)](https://github.com/tmux-plugins/tpm)
- [nord color scheme](https://www.nordtheme.com/docs/ports/tmux/installation)
