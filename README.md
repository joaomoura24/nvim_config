## Try out this config

Make sure to remove or move your current `nvim` directory

**IMPORTANT** Requires [Neovim v0.8.0]](https://github.com/neovim/neovim/releases).  [Upgrade](#upgrade-to-latest-release) if you're on an earlier version. 
```
git clone git@github.com:joaomoura24/nvim_config.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

Open `nvim` and enter the following:

```
:checkhealth
```

## Install fonts

- get any [nerd font](https://www.nerdfonts.com/font-downloads). (I like the Hack font)
- move *.ttf font files to folder in ~/.local/share/fonts/<desired_font>
- fc-cache -f # for cleaning the fonts
- go to terminal preferences and point to desired font
