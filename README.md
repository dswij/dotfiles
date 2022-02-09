# Getting started

1. Create a bare repo at `$HOME/.cfg`
```sh 
git clone --bare git@github.com:dswij/dotfiles $HOME/.cfg
```

2. Checkout your dotfiles repo
```sh
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```

3. Restart shell and stuff

# TODO

- [] Fix the save current working directory thingy
- [] ~~Get the glow.nvim working for neovim config~~ This is already installed in neovim
- [] Add some install scripts
