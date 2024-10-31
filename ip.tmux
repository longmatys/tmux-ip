#!/bin/bash
declare -A ifaces

get_ip_addresses() {
  # Check if 'ip' command is available
  if type ip > /dev/null 2>&1; then
    while IFS= read -r line; do
      iface=$(echo "$line" | awk '{print $2}' | sed 's/://')
      ip=$(echo "$line" | awk '{print $4}' | cut -d'/' -f1)
      ifaces["$iface"]="$ip"
    done < <(ip -o -4 addr show | grep brd)

  # Fallback to ifconfig if 'ip' command is not available
  elif type ifconfig > /dev/null 2>&1; then
    while IFS= read -r line; do
      iface=$(echo "$line" | awk '{print $1}')
      ip=$(echo "$line" | awk '{print $2}')
      ifaces["$iface"]="$ip"
    done < <(ifconfig | grep -A 1 'inet ' | awk '/flags|inet/ {print}')
  else
    echo "Neither 'ip' nor 'ifconfig' commands are available."
    return 1
  fi
}

# Call the function
get_ip_addresses

test_show_ip_addresses(){
        # Example of how to display the map
        for iface in "${!ifaces[@]}"; do
          echo "Interface: $iface, IP: ${ifaces[$iface]}"
        done
}

update_tmux_option() {
        local option=$1
        local option_value="$(tmux show-option -gqv "$option")"
        local sum
        for iface in "${!ifaces[@]}"; do
                option_value=${option_value//\#\{ip_${iface}_desc\}/$iface: ${ifaces[$iface]}}
                option_value=${option_value//\#\{ip_${iface}\}/${ifaces[$iface]}}
                if [ -n "$sum" ]; then 
                        sum="${sum}, " 
                fi
                sum="${sum}${iface}(${ifaces[$iface]})"
        done
        option_value=${option_value//\#\{ip\}/$sum}
        tmux set-option -gq "$option" "$option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
