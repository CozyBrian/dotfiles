# dotfiles

Tmux config managed via symlinks.

## Prerequisites
- tmux
- git
- curl (for TPM install)

## Install
1. Clone this repo:

```bash
git clone <repo-url> ~/dotfiles
```

2. Move any existing tmux config out of the way:

```bash
mv ~/.tmux.conf ~/.tmux.conf.bak
```

3. Symlink the config:

```bash
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

4. Install TPM (tmux plugin manager):

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

5. Reload tmux config and install plugins:

```bash
tmux source-file ~/.tmux.conf
```

Then press `prefix + I` inside tmux to install plugins.

## Notes
- Prefix is `C-a`.
- Reload tmux config with `prefix + r`.
- Plugins are defined in `.tmux.conf` and installed via TPM.
