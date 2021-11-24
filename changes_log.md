# Changes Made

This is a file that contains changes and additions made to my settings after initial install.
It also contains steps that I do to create my optimized setup.
There will be additional .sh files made later to automate these changes (hopefully).

1. Create `~/Projects`
2. Create `~/.config` if it doesn't already exist
3. Set up .config to track from dotfiles repo and pull
4. In `/etc/X11/xorg.conf.d/30-touchpad.conf` I made the following changes:

```xf86conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
EndSection
```

> Became:

```xf86conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "Natural Scrolling" "true"
EndSection
```

5. Install Firefox

`sudo pamac firefox`

6. Setup SSH keys

```sh
ssh-keygen -t ed25519 -C "mtmcglawn@gmail.edu"
```

> When asked for a location use the default.
> Also, if you don't want to have to enter a password everytime, leave the passwords blank.

```sh
ssh-add ~/.ssh/id_ed25519
```

7. Install the new ssh keys to GitHub - must use firefox (palemoon not supported on github)

8. Instal neovim dependencies:

`sudo pamac install cmake`
`sudo pamac install unzip`

9. Install Neovim

`cd ~/Projects && git clone git@github.com:neovim/neovim.git`

10. Build and release neovim

```sh
cd ~/Projects/neovim && rm -r build/
make CMAKE_:INSTALL_PREFIX=/opt/neovim
sudo make install
```

11. Update i3 config file

```sh
cp ~/.i3/config ~/.i3/config.orig
```

Then replace/adjust the old config file.

12. Change as many cache locations to be within `.config` to clean up the home directory

* Create /etc/profile.d/a-xdg-config.sh and add:

```sh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/.cache"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/.share"
export XDG_RUNTIME_HOME="$XDG_CONFIG_HOME/.share"
```

* Inside 

13. If the file `~/.dir_colors` exists and `/etc/DIR_COLORS` does not, do the following:

```sh
sudo mv ~/.dir_colors /etc/DIR_COLORS
sudo chown root:root /etc/DIR_COLORS
```

13. Inside `/etc/bash.bashrc` add:
```sh
if [ -f ${XDG_CONFIG_HOME}/bash/bashrc ]; then
	. ${XDG_CONFIG_HOME}/bash/bashrc
fi
```



#Installs from Source

Optional steps to take after installing from source in order to add to all users.

```sh
#sudo ln -s /opt/neovim/bin/nvim /usr/bin/nvim
#sudo cp -r /opt/neovim/share/applications/nvim.desktop /usr/share/applications
```
