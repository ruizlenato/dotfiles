#!/bin/bash

current_workspace=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .name | tonumber')
workspaces=($(swaymsg -t get_workspaces | jq -r '.[] | .name | tonumber' | sort -n))

next_workspace=0
for i in "${!workspaces[@]}"; do
    if (( workspaces[i] == current_workspace )); then
        next_workspace=$(( (i + 1) % ${#workspaces[@]} ))
        break
    fi
done

swaymsg workspace "${workspaces[next_workspace]}"
