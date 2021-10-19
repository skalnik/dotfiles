function fish_battery
  if [ -n "$CODESPACES" ]
    # No battery in Codespaces
    return
  end

  set --local output (pmset -g batt)
  set --local battery (echo "$output" | grep 'Battery Power')

  if [ "$battery" ]
    set --local discharging (echo "$output" | grep 'discharging' )
    set --local time (echo "$output" | grep -oh '\d*:\d\d')

    if [ "$discharging" ] && [ "$time" ]
      echo -n "🔋 ("
      set_color --bold red
      echo -n "↯ $time"
      set_color normal
      echo ")"
    else
      echo "🔋"
    end
  else
    set --local charging (echo "$output" | grep 'charging')
    set --local percentage (echo "$output" | grep -oh "\d*%")

    if [ "$charging" ] && [ "$percentage" ]
      echo -n "🔌 (⚡️ "
      set_color --bold green
      echo -n "$percentage"
      set_color normal
      echo ")"
    else
      echo "🔌"
    end
  end
end
