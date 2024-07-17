# NEO-VIM Setup

## Plugins and Commands

To manage plugins in NEO-VIM, use the following commands:

-'sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'' to insatll vim plug
- `:PlugInstall` to install the plugins.
- `:PlugUpdate` to update the installed plugins.
- `:PlugDiff` to review changes from the last update.
- `:PlugClean` to remove plugins that are no longer listed.

# KONSOLE Configuration

When configuring KONSOLE, ensure to locate the correct path for the configuration files:

- The default configuration directory is typically located at `~/.config/konsole`.

Make sure to adjust paths accordingly depending on your setup.
