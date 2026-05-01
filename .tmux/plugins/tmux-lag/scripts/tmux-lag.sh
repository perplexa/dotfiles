#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/helpers.sh"

get_lag() {
  local wait=0.2
  local target="9.9.9.9"
  local time=$(ping -c 2 -i $wait $target 2>/dev/null | grep -Eo 'time=[0-9.]+' | tail -1 | cut -d= -f2)
  [ -n "$time" ] || return
  printf '%s ms' "$time"
}

main() {
  local refresh=1 # seconds
  local update_interval=$(get_tmux_option "@tmux-lag-interval" $refresh)
  local current_time=$(date "+%s")
  local previous_update=$(get_tmux_option "@lag-previous-update-time")
  local delta=$((current_time - previous_update))

  if [ -z "$previous_update" ] || [ $delta -ge $update_interval ]; then
    local value
    if value=$(get_lag); then
      $(set_tmux_option "@lag-previous-value" "$value")
    else
      $(set_tmux_option "@lag-previous-value" "DISCON")
    fi
    $(set_tmux_option "@lag-previous-update-time" "$current_time")
  fi

  echo -n $(get_tmux_option "@lag-previous-value")
}

main
