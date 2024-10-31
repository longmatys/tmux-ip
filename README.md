# tmux-ip
tmux ip module

tmux plugin showing your IP address in tmux status line

## Installation with Tmux Plugin Manager (recommended)

Add plugin to the list of TPM plugins in .tmux.conf:

```
set -g @plugin 'longmatys/tmux-ip/ip.tmux'
```

Hit `prefix + I` to fetch the plugin and source it.


## Manual Installation

Clone the repo:

```sh
git clone https://github.com/longmatys/tmux-ip.git  ~/clone/path
```

Add this line to the bottom of .tmux.conf:

```
run-shell ~/clone/path/ip.tmux
```

Reload TMUX environment with `tmux source-file ~/.tmux.conf`.


## Usage

To display the IP address in the tmux status line, add `#{ip}`.
This plugin supports these variables:
- `#{ip}`
  this will list all ips on the system
- `#{ip_<IFACE>}`
  this will show just one interface ip
- `#{ip_<IFACE>_desc}`
  this will show one interface in a longer form

```
set -g status-left "#{ip}"
```
## Inspiration
I have been inspired by by https://github.com/TamDik/ip.tmux.git
