# dotfiles

A collection the dotfiles I use in my daily workflow.

![](screenshot.png)

## Description

This includes the relevant dotfiles and general `.config` files I use across both a **macOS** environment, as well as an **Arch Linux** environment. The *Arch* environment relies on [bwpsm](https://github.com/baskerville/bspwm) as a window manager, [sxhkd](https://github.com/baskerville/sxhkd) for keybindings, [rofi](https://github.com/davatorium/rofi) as a launcher, and [polybar](https://github.com/polybar/polybar) as a status bar.

My preferred shell is **zsh**. The ``zshrc`` file relies on [antibody](https://getantibody.github.io/) to manage plugins. These plugins are listed [here](zsh/zsh_plugins.txt).

## Requirements

See the relevant homepages for the Arch-based components listed [above](#description):
* [bwpsm](https://github.com/baskerville/bspwm)
* [sxhkd](https://github.com/baskerville/sxhkd)
* [rofi](https://github.com/davatorium/rofi)
* [polybar](https://github.com/polybar/polybar)

to install software and relevant dependencies, or consider using a package manager like the [AUR](https://aur.archlinux.org/) with [yay](https://github.com/Jguer/yay) to make installation of these easier, if running something like [Arch](https://www.archlinux.org/) / [Manjaro](https://manjaro.org/) / [Artix](https://artixlinux.org/)

## Installation

As a bit of a **disclaimer**; if you're combing through a dotfiles repository, you may wish to pick and choose components from various repositories to create your own; in this case, you may not wish to follow these steps. Otherwise, the following steps will be divided into four separate stages:

1. preliminary setup necessary for either (2) or (3)
2. installing the dotfiles for my `zsh` configuration
3. linking my `config` files for non-`zsh` components 
4. a handful of application-specific installation steps to use files in [config](config)

### Cloning

1. To begin either / both parts, clone the repository:

```sh
git clone https://github.com/bradendubois/dotfiles <dotfile_location>
```

where ``<dotfile_location>`` is the desired location on your machine for this repository. This setup is rather flexible, and can be cloned reasonably anywhere.

2. Open the file [zsh/zprofiles/zprofile-start](zsh/zprofiles/zprofile-start) in your text editor of choice. Edit the following line:
```sh
export DOTFILES="$HOME/dotfiles"
```

such that ``DOTFILES`` points to wherever the repository is located on your machine. This `zprofile-start` file will be used as an easy way to point a few crucial environment variables to this repository so that most remaining components should ✨ *just work* ✨.

3. Symlink this `zprofile-start` file in the dotfiles repository to your `HOME` directory as `.zprofile`:

```sh
ln dotfiles/zsh/zprofiles/zprofile-start ~/.zprofile
```

**Note**: Based on your current working directory, where the repository is cloned, etc., you may need to tweak the first argument, `dotfiles/zsh/zprofiles/zprofile-start`, to point to the `zprofile-start` file.

4. Log out and back in. This will load `.zprofile` and should set the `DOTFILES` and `ZDOTDIR` environment variables accordingly.

### zsh setup

In order to use some ✨ *snazzy* ✨ **zsh** plugins, I use (and recommend) `antibody`. Do not worry if your terminal prints some errors before this section has been followed all the way through, this is expected.

1. Install [antibody](https://getantibody.github.io/).
2. Restart your terminal session. Provided `antibody` is now on your path, the plugins located at [zsh/zsh_plugins.txt](zsh/zsh_plugins.txt) are being automatically installed.

Thanks to `antibody` and some refactors, this section has gotten a lot shorter!

#### miscellanea

* `Antibody` uses **"static loading** to make loading plugins faster. See the section **Static loading** [here](https://getantibody.github.io/usage/) for more details on bundling.
* My `zsh` configuration is made to load unique *different files* depending on the operating system detected by running `uname`. This can be used to load different files depending on **macOS** or **Linux** being used. This can be seen in the [.zshrc](zsh/.zshrc) and [zprofile](zsh/zprofiles/zprofile) files included.

### .config setup

Many components can be installed by simply linking or copying files from [config](config) to the `$HOME/.config` or equivalent directory. For simplicity, we can move existing configuration files found at `~/.config` into the repository and symlinking the repository's `config` folder to begin tracking those files.

1. Move any existing files into the repository's `config` folder:
```sh
mv ~/.config/* $DOTFILES/config
```

2. Remove the now-empty `.config` folder:
```sh
rm -r .config
```

3. Symlink the repository's `config` folder to the home directory: 
```sh
ln -sv $DOTFILES/config ~/.config
```

This last step could be different, depending on your preference and desire for [XDG Base Directories](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html). This is not necessary to change, and will work as-is, but one might wish to set their `XDG_CONFIG_HOME` directory somewhere else. My `XDG_` environment variables are set in [zsh/zprofiles/zprofile](zsh/zprofiles/zprofile), and can be tweaked. Of course, doing so will require a fresh login to take effect.

### Application-Specific setup

Here are a handful of ways to start using the provided config files for various applications.

#### VS Code

A list of extensions for [Visual Studio Code](https://code.visualstudio.com/) is provided at [config/code-extensions](config/code-extensions). Once VS Code has been installed, all extensions can be installed with:

```shell
cat config/code-extensions | xargs -n 1 code --install-extension
```

Optionally, **keybindings** and **settings** are also provided in [config/Code/User/](config/Code/User/){[keybindings.json](config/Code/User/keybindings.json), [settings.json](config/Code/User/settings.json)}. These can be linked to the same directory under `$HOME/.config`.

#### Vim / Nvim

To manage plugins for Vim / Nvim (though I use Nvim), install [junegunn/vim-plug](https://github.com/junegunn/vim-plug).

After linking the `init.vim` [file](config/nvim/init.vim) under [config/nvim](config/nvim), run:
```shell
:PlugInstall
```
#### Picom

While any [picom](https://wiki.archlinux.org/title/Picom) source should work, the [ibhagwan/picom](https://github.com/ibhagwan/picom) fork supports rounded corners, which is included in [my .conf file](config/picom/picom.conf).

If using a distro like Arch Linux, Manjaro, or Artix Linux, the `picom-ibhagwan-git` package will work.

```sh
pacaur -S picom-ibhagwan-git
```

## Acknowledgements

* The repository [unixorn/awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins#plugins) provided an awesome starting point for finding tons of incredibly useful plugins.
* The subreddit [r/unixporn](https://www.reddit.com/r/unixporn/) is exceptionally creative and provides many great dotfiles setups to take (rightfully attributed!) inspiration from.

## Contributions

If ...

* the directions are not working as expected
* you have some fun suggestions for **zsh** plugins you like
* you have questions or suggestions on how to improve the setup or documentation

then [email me](mailto:braden.dubois@usask.ca)!
