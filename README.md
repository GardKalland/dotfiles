# My dotfiles

This repo contains my dotfiles for my PC and mac. Using Stow and git.

## Requirements

Ensure you have the following installed on your sytem

### Git

For Arch:

```
pacman -S git

```

For mac (with homebrew):

```
brew install git

```

### Stow

For Arch:

```
pacman -S stow

```

For mac (with homebrew):

```
brew install stow

```

## Installation

First, check that the dotfiles repo are in the $HOME directory

```
git clone git@github.com/GardKalland/dotfiles.git

```

```
cd dotfiles
```

then use GNU stow to create symlinks

```
stow .
```

## How to use

### Adding

You need to copy the directory you want into the dotfiles repo. _The configs needs to match the systems config, with layers_

To add new do (you are inside the dotfiles repo):

`cp ~/.[path to file] [same path and name] `

Then when added do:

`stow .`

This will create symlinks from the original path into the dotfiles repo

### Conflicts

If you have conflicts when adding symlinks then you have two options:

1. Change the name of the file in the system:

`mv ~/.[path to file] ~/.[path to file(change name)]`

2. Use stow adopt to fix it.

```
stow --adopt .
```

_This will overwrite the files in the systempath to make it into an symlink_
