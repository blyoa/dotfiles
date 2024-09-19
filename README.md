dotfiles
=======

install
-------

```bash
$ git clone https://github.com/blyoa/dotfiles.git ~/.dotfiles

$ # edit params
$ vim ~/.dotfiles/nix/params/default.nix

$ nix run home-manager -- switch --flake ~/.dotfiles
```
