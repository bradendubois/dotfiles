# dotfiles

A collection the dotfiles I use in my daily workflow. A bit different from [arch-setup](https://github.com/bradendubois/arch-setup)'s [dotfiles](https://github.com/bradendubois/arch-setup/tree/master/dotfiles); I've switched to [zsh](https://en.wikipedia.org/wiki/Z_shell).

![](screenshot.png)

## Contents

* [Requirements](#requirements)
* [Dependencies](#dependencies)
* [Installation](#installation)
* [Acknowledgements](#acknowledgements) 

## Requirements

To set everything up, you'll need:

* [ruby](https://www.ruby-lang.org/en/) and [rubygems](https://rubygems.org/)
* [pip](https://pypi.org/project/pip/)
* [curl](https://curl.haxx.se/)

Everything else is either already there or will be installed.

## Dependencies

What's all in the box?

My ``zshrc`` file relies on [antigen](https://github.com/zsh-users/antigen), which has been exceptionally easy to set up, modify, and use in customizing everything.

By default, antigen will install and run the following:

* Standard [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) plugins:
  * git
  * wd
  * thefuck
* Non-default plugins:
  * [Valiev/almostontop](https://github.com/Valiev/almostontop)
  * [Cloudstek/zsh-plugin-appup](https://github.com/Cloudstek/zsh-plugin-appup)
  * [arzzen/calc.plugin.zsh](https://github.com/arzzen/calc.plugin.zsh)
  * [ael-code/zsh-colored-man-pages](https://github.com/ael-code/zsh-colored-man-pages)
  * [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions)
  * [igoradamenko/npm.plugin.zsh](https://github.com/igoradamenko/npm.plugin.zsh)

Antigen will also install [geometry-zsh/geometry](https://github.com/geometry-zsh/geometry), a very clean and customizable zsh theme.

I also use Ruby to install [athityakumar/colorls](https://github.com/athityakumar/colorls), making ``ls`` far prettier.

Pip is used to install [pwittchen/spotify-cli-linux](https://github.com/pwittchen/spotify-cli-linux), which allows some easy Spotify access from the command-line.

## Installation

Here's how one can use this repo as a starting point for their own machine.

To begin, you'll want to go ahead and clone the project:
```sh
git clone https://github.com/bradendubois/dotfiles <dotfile_location>
```
where ``<dotfile_location>`` is the desired location on your machine for this repository.

Next, navigate to the location of the cloned repository:
```sh
cd <dotfile_location>
```

***All remaining commands given will assume that the user's current working directory is still the root of the ``dotfiles`` repository.*** 

Open the file ``zshrc`` in your text editor of choice. Near the top, edit the following line:
```sh
export DOTFILES="$HOME/dotfiles"
```
such that ``DOTFILES`` points to wherever the repository is located on your machine.


You will need to install [antigen](https://github.com/zsh-users/antigen) and place it in the repository's ``zsh`` folder:
```sh
curl -L git.io/antigen > zsh/antigen.zsh
```

Install [pwittchen/spotify-cli-linux](https://github.com/pwittchen/spotify-cli-linux) using [pip](https://pypi.org/project/pip/):
```sh
sudo pip install spotify-cli-linux
```

Install  [athityakumar/colorls](https://github.com/athityakumar/colorls) using [rubygems](https://rubygems.org/):
```sh
gem install colorls
```

**Note**: You may need to tweak your ``$PATH`` to include ``ruby``. See the file ``dotfiles/zsh/path`` for the easiest way to do so.

Now, you will need to link a few files.

If you have a previous ``~/.zshrc`` file, you'll need to move it:
```sh
mv ~/.zshrc ~/.zshrc-old
```

Similarly, if you have a previous ``~/.warprc`` file and you want to use the one in this repository:
```sh
mv ~/.warprc ~/.warprc-old
```

Now, you can symlink ``zshrc`` and ``warprc`` from this repository:
```sh
ln zshrc ~/.zshrc
ln warprc ~/.warprc
```

And with that, starting a new terminal instance should install all the antigen plugins and be fully set up.

## Acknowledgements

* The repository [unixorn/awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins#plugins) provided an awesome starting point for finding tons of incredibly useful plugins.
