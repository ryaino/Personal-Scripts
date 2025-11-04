
```bash
git clone https://github.com/ryaino/Personal-Scripts.git ~/setup-stuff
ln -s ~/setup-stuff/.dotfiles/.zshrc ~/.zshrc
ln -s ~/setup-stuff/.dotfiles/.spaceshiprc.zsh ~/.spaceshiprc.zsh

```

## Fedora
```bash
    sudo dnf install fira-code-fonts
```


```bash
sudo apt install zsh
sudo apt-get install fonts-powerline

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```