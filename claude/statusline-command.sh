#!/usr/bin/env bash

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
cost_usd=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
rl_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')

# ANSI colors
GREEN='\033[32m'
RED='\033[31m'
RESET='\033[0m'

build_bar() {
  local pct=$1
  local filled=$(( pct * 10 / 100 ))
  local empty=$(( 10 - filled ))
  local bar=""
  for ((i=0; i<filled; i++)); do bar+="█"; done
  for ((i=0; i<empty; i++)); do bar+="░"; done
  echo "$bar"
}

if [ -n "$used_pct" ]; then
  used_rounded=$(printf "%.0f" "$used_pct")
  bar=$(build_bar "$used_rounded")
  if [ "$used_rounded" -gt 80 ]; then
    color="$RED"
  else
    color="$GREEN"
  fi
  context_part=$(printf "${color}${bar}${RESET} ${used_rounded}%%")
else
  context_part="░░░░░░░░░░ --%"
fi

if [ -n "$rl_pct" ]; then
  rl_rounded=$(printf "%.0f" "$rl_pct")
  rl_bar=$(build_bar "$rl_rounded")
  if [ "$rl_rounded" -gt 80 ]; then
    rl_color="$RED"
  else
    rl_color="$GREEN"
  fi
  rl_part=$(printf "5h ${rl_color}${rl_bar}${RESET} ${rl_rounded}%%")
else
  rl_part="5h ░░░░░░░░░░ --%"
fi

if [ -n "$cost_usd" ]; then
  cost_part=$(printf '$%.2f' "$cost_usd")
else
  cost_part="\$--"
fi

printf '%s' "$model | $context_part | $rl_part | $cost_part"
