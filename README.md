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
### For use with with catppuccin theme

```
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'longmatys/tmux-ip'

set -ug @catppuccin_flavor
set -g @catppuccin_flavor 'mocha'
set -g @catppuccin_window_status_style "rounded"

# Make the status line pretty and add some module
set -g status-right-length 200
set -g status-left-length 100
set -g status-left ""

%hidden MODULE_NAME="ip"
set -ug "@catppuccin_status_${MODULE_NAME}_icon_bg"
set -ogq "@catppuccin_status_${MODULE_NAME}_icon_bg" "#{E:@thm_flamingo}"
set -ug "@catppuccin_status_${MODULE_NAME}_icon_fg"
set -ogq "@catppuccin_status_${MODULE_NAME}_icon_fg" "#{E:@thm_bg}"
set -ug "@catppuccin_status_${MODULE_NAME}_text_fg"
set -ogq "@catppuccin_status_${MODULE_NAME}_text_fg" "#{E:@thm_fg}"
set -ug "@catppuccin_status_${MODULE_NAME}_text_bg"
set -ogq "@catppuccin_status_${MODULE_NAME}_text_bg" "#{E:@thm_bg}"
set -ug "@catppuccin_${MODULE_NAME}_icon"
set -ogq "@catppuccin_${MODULE_NAME}_icon" " "
set -ug "@catppuccin_${MODULE_NAME}_color"
set -ogqF "@catppuccin_${MODULE_NAME}_color" "#{E:@thm_green}"
set -ug "@catppuccin_${MODULE_NAME}_text"
set -ogq "@catppuccin_${MODULE_NAME}_text" " #{l:#{ip}}"
source "~/.tmux/plugins/tmux/utils/status_module.conf"

set -agF status-right "#{E:@catppuccin_status_ip}"
run '~/.tmux/plugins/tmux-cpu/cpu.tmux'
```
Dont forget to hit `prefix + I` to fetch the plugin and source it.



## Inspiration
I have been inspired by by https://github.com/TamDik/ip.tmux.git
