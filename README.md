# Dotfiles for Mac

## Setup

### Github

Create a github repo called dotfiles. 

*DO NOT INITIALIZE IT WITH A README*

### Create bare git locally

```bash
git init --bare $HOME/.dotfiles
```

### Create an alias
```bash
echo "alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> ~/.zshrc
```

### Source the shell 
```bash
source ~/.zshrc
```

### Configure Git to hide untracked files
Will come many things up in the commit and status if you dont
```bash
config config --local status.showUntrackedFiles no
```

### Linking to repo

Need to link it to the repo by either using ```ssh``` or ```https```

Using ssh: 

```bash 
config remote add origin https://github.com/"username"/dotfiles.git
```

### Using the config. 

You can now use ```config [commands] ``` instead of ```git [commands]```, this will push things to the dotfile repo. 
  
