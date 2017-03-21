[Tmux](http://tmux.sourceforge.net/) is a terminal multiplexer. Tested with tmux 1.5+.

This config has support for [tmux-mem-cpu-load](http://github.com/thewtex/tmux-mem-cpu-load).

Prefix mapped to Ctrl-A for `screen` users.

Installation
------------

  Download:

```bash
git clone https://github.com/tony/tmux-config.git ~/.tmux
```

  Copy tmux config to home:

```bash
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
```

  Go to config dir:

```bash
cd ~/.tmux
```

Stats
-----

### tmux-mem-cpu-load

Works on Linux and OS X.

  Prep ourself to download submodule:

```bash
git submodule init
```

  Download submodule:

```bash
git submodule update
```

  Change dir to tmux-mem-cpu-load:

```bash
cd ~/.tmux/vendor/tmux-mem-cpu-load
```

  General make file:

```bash
cmake .
```

  Compile our binary:

```bash
make
```

  Install our binary to `/usr/local/bin/tmux-mem-cpu-load`:

```bash
sudo make install
```

  Go home:

```bash
cd ~
```

  Launch tmux:
```
tmux
```
  And press `Control + a` then `d` to go back to the terminal.

  Update config:

```bash
tmux source-file ~/.tmux.conf
```

### basic-cpu-and-memory.tmux

(Cross platform, tested with python 2.7+)

Update March 19, 2014. Works with psutil 2.0 now.

Install ``psutil``:

```bash
sudo pip install psutil
```

copy ``~/.tmux/vendor/basic-cpu-and-memory.tmux`` to bin:

```bash
sudo cp ~/.tmux/vendor/basic-cpu-and-memory.tmux /usr/local/bin/tmux-mem-cpu-load
```

make executable:
```bash
sudo chmod +x /usr/local/bin/tmux-mem-cpu-load
```

### Powerline (Advanced)

You can add suport for [powerline](https://github.com/powerline/powerline) by adding these
to your ``~/.tmux.conf``. Be sure to grab and install [powerline-fonts](https://github.com/powerline/fonts)
for your system.

See [Powerline on ReadTheDocs.org](https://powerline.readthedocs.org/en/master/) for more info.

```
# pip install --user git+git://github.com/powerline/powerline
if-shell 'test -f ~/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf' 'source-file ~/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf'

# [sudo] pip install git+git://github.com/powerline/powerline
if-shell 'test -f /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf' 'source-file /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf'

# [sudo] pip install git+git://github.com/powerline/powerline
if-shell 'test -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/tmux/powerline.conf' 'source-file /usr/local/lib/python2.7/dist-packages/powerline/bindings/tmux/powerline.conf'
# using python3.3
if-shell 'test -f /usr/local/lib/python3.3/dist-packages/powerline/bindings/tmux/powerline.conf' 'source-file /usr/local/lib/python3.3/dist-packages/powerline/bindings/tmux/powerline.conf'
# python 3.4?
# if-shell 'test -f /usr/local/lib/python3.4/dist-packages/powerline/bindings/tmux/powerline.conf' 'source-file /usr/local/lib/python3.4/dist-packages/powerline/bindings/tmux/powerline.conf'
```

Start tmux
----------

To start a session:

`tmux`

To reattach a previous session:

`tmux attach`

To reload config file

`<Control + b>:` (which could Ctrl-B or Ctrl-A if you overidden it) then `source-file ~/.tmux.conf`

Commands
--------

Our prefix/leader key is `Control + a` now (just like the `screen` multiplexer). This sequence must be typed before any tmux shortcut.

* `Control + a` before any command
* `Control + a` then `?` to bring up list of keyboard shortcuts
* `Control + a` then `"` to split window
* `Control + a` then `<Space>` to change pane arrangement
* `Control + a` then `o` to rotate panes
* `Control + a` then `h`, `j`, `k`, `l` to move left, down, up, right. Respectively. (vim hjkl)
* `Control + a` then `;` to go to last panel

Beyond your first window:

* `Control + a` then `c` to create a new window
* `Control + a` then `n` to next window
* `Control + a` then `p` to previous window
* `Control + a` then `[0-9]` move to window number
* `Control + a` then `&` to kill window

Custom:

* `Control + a` then `m` to switch to ``main-horizontal`` layout with the main window at 60% height.

More configs / Tools
--------------------

* *Save / Load your tmux workspaces through JSON or YAML* with [tmuxp](https://github.com/tony/tmuxp).
* *Clone + Synchronize your git / hg / svn projects through JSON / YAML* with [vcspull](https://github.com/tony/vcspull).
* *Modular, Lazy-loading vim configuration* with support for C, C++, Python, Go and Javascript with [tony/vim-config](https://github.com/tony/vim-config)
* *Modular dot-config example* [tony/.dot-config](https://github.com/tony/.dot-config)

Other
-----

* Github: http://www.github.com/tony
* Website: http://www.git-pull.com
* LICENSE: MIT
* Author: Tony Narlock (tony@git-pull.com)


# Tmux Plugin Manager

[![Build Status](https://travis-ci.org/tmux-plugins/tpm.png?branch=master)](https://travis-ci.org/tmux-plugins/tpm)

Installs and loads TMUX plugins.

Tested and working on Linux, OSX, and Cygwin.

### Installation

Requirements: `tmux` version 1.9 (or higher), `git`, `bash`.

Clone TPM:

    $ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Put this at the bottom of `.tmux.conf`:

    # List of plugins
    set -g @plugin 'tmux-plugins/tpm'
    set -g @plugin 'tmux-plugins/tmux-sensible'

    # Other examples:
    # set -g @plugin 'github_username/plugin_name'
    # set -g @plugin 'git@github.com/user/plugin'
    # set -g @plugin 'git@bitbucket.com/user/plugin'

    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run '~/.tmux/plugins/tpm/tpm'

Reload TMUX environment so TPM is sourced:

    # type this in terminal
    $ tmux source ~/.tmux.conf

That's it!

### Installing plugins

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Press `prefix + I` (capital I, as in **I**nstall) to fetch the plugin.

You're good to go! The plugin was cloned to `~/.tmux/plugins/` dir and sourced.

### Uninstalling plugins

1. Remove (or comment out) plugin from the list.
2. Press `prefix + alt + u` (lowercase u as in **u**ninstall) to remove the plugin.

All the plugins are installed to `~/.tmux/plugins/` so alternatively you can
find plugin directory there and remove it.

### Key bindings

`prefix + I`
- Installs new plugins from GitHub or any other git repository
- Refreshes TMUX environment

`prefix + U`
- updates plugin(s)

`prefix + alt + u`
- remove/uninstall plugins not on the plugin list

### More plugins

For more plugins, check [here](https://github.com/tmux-plugins).

### Docs

- [Help, tpm not working](docs/tpm_not_working.md) - problem solutions

More advanced features and instructions, regular users probably do not need
this:

- [How to create a plugin](docs/how_to_create_plugin.md). It's easy.
- [Managing plugins via the command line](docs/managing_plugins_via_cmd_line.md)
- [Changing plugins install dir](docs/changing_plugins_install_dir.md)
- [Automatic TPM installation on a new machine](docs/automatic_tpm_installation.md)

### Tests

Tests for this project run on [travis](https://travis-ci.org/tmux-plugins/tpm).

When run locally, [vagrant](https://www.vagrantup.com/) is required.
Run tests with:

    # within project directory
    $ ./run_tests

### Other goodies

- [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) - a plugin for
  regex searches in tmux and fast match selection
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - enables copying
  highlighted text to system clipboard
- [tmux-open](https://github.com/tmux-plugins/tmux-open) - a plugin for quickly
  opening highlighted file or a url
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - automatic
  restoring and continuous saving of tmux env

You might want to follow [@brunosutic](https://twitter.com/brunosutic) on
twitter if you want to hear about new tmux plugins or feature updates.

### License

[MIT](LICENSE.md)
