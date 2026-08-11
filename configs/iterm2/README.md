# iTerm2

## Steps for `iTerm2` setup
I got my latest inspiration for this setup from [this video](https://www.youtube.com/watch?v=wNQpDWLs4To).

<!-- TODO: I think this is done through Karabiner-Elements. So I don't need to do anything manually. -->
<!-- TODO: If above is correct. REMOVE NEXT LINE. -->
### 0 - Rearrange MacOS `Capslock` keyboard's key to become new `Escape` key

### 0 - Start `iTerm2`

### 1 - Make `iTerm2` the default MacOS terminal
Choose `iTerm2 -> Make iTerm2 Default Term` menu item.

### 2 - Make sure that `iTerm2` default shell is `Zsh`

### 3 - Install `iTerm2` shell integration
1. Choose `iTerm2 -> Install Shell Integration` menu item.
    - Follow setup steps from the pop-up window.
3. Restart terminal to activate shell integration.
For more information on how to use it, see the [official documentation](https://iterm2.com/documentation-shell-integration.html).

### 4 - Install `Oh My Zsh` (framework for managing your Zsh configuration)
Find how to do it in its [documentation](https://github.com/ohmyzsh/ohmyzsh).

### 5 - Install Zsh prompt
Install `Starship` prompt using its [official documentation](https://starship.rs/#quick-install).

### 6 - Install additional fonts that I like and may want to try in future
```zsh
brew install font-fira-code-nerd-font font-hack-nerd-font
```

### 7 - Apply `iTerm2` config stored in this repo
- Press `<Cmd>+,` to open `iTerm2` settings
- Go to `General->Settings`
- Switch on `Load settings from a custom folder or URL`
- Browse to `go/src/github.com/{GITHUB_USER_NAME}/setenv/configs/iterm2`
- Choose option `Save changes - Manually`
- To apply settings stored in this repo -> restart `iTerm2` by quiting the application and re-opening it back
- Choose option `Save changes - Automatically`
- Press `Save Now` button
- Restart `iTerm2` one more time and check that no new changes were detected in this repo and config was applied successfully.

That's it! From now on `iTerm2` [settings](com.googlecode.iterm2.plist) will be loaded and saved automatically in this repo.

### 8 - Optionally import and/or change terminal color theme
Current default `iTerm2` theme is `Dark+`. You can find it [here](https://iterm2colorschemes.com/).

As a spare `iTerm2` theme I've added [Dracula](https://draculatheme.com/iterm). And even more of them... Maybe you want to give it a try later.

All of them were already imported and saved in the current `iTerm2` [config file](com.googlecode.iterm2.plist). _But don't be scary to import and apply something new!_

### 9 - Optionally change font in the terminal
Check for more developer's fonts [here](https://www.nerdfonts.com/font-downloads) or choose from already installed ones.

### 10 - Install/setup `Oh My Zsh` plugins
#### 10.1 - `zsh-syntax-highlighting`
1. Open plugin [installation doc](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh).
2. Search for `Oh-my-zsh` section, if it is not opened automatically. Found section contains steps for plugin installation, using `Oh My Zsh` plugin manager.

#### 10.2 - `zsh-autosuggestions`
1. Open plugin [installation doc](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh).
2. Search for `Oh My Zsh` section, if it is not opened automatically. Found section contains steps for plugin installation, using `Oh My Zsh` plugin manager.

### 11 - Install colorized `ls` output
Follow the installation steps from the [official documentation](https://github.com/athityakumar/colorls?tab=readme-ov-file#installation).

#### 11.1 - Setup `ls, ll, la` aliases in `~/.zshrc` file

## 12 - Optionally setup a new `Hotkey Window`
Remove the existing one:
1. Remember creation options of the existing `Hotkey Window`.
    - Choose `iTerm2->Settings->Profiles->Hotkey Window->Keys`.
    - Press `Configure Hotkey Window`. Remeber all options from this window.
        - After remebering all options close this window.
    - Choose `Window` setting and remember `Transparency` option.
2. Choose `iTerm2->Settings->Profiles->Hotkey Window`.
3. Press `-` to remove existing `Hotkey Window` profile.

To create new dedicated `Hotkey Window`:
1. Go to `iTerm2->Settings->Keys->Hotkey`.
2. Press `Create a Decicated Hotkey Window`
    - Set `Hotkey` to `Cmd+F12`.
    - Choose the same options which you remembered on the removal step.
3. Set `Hotkey Window` transparency to `7`.

