function battery
  set --local output (pmset -g batt)
  set --local battery (echo "$output" | grep 'Battery Power')

  if [ "$battery" ]
    set --local time (echo "$output" | grep -oh '\d*:\d\d')

    if [ "$time" ]
      echo "on 🔋 ($time remaining) in "
    else
      echo "on 🔋 in "
    end
  else
    set --local charging (echo "$output" | grep 'charging')

    if [ "$charging" ]
      set --local percentage (echo "$output" | grep -oh "\d*%")

      if [ "$percentage" ]
        echo "($percentage) 🔌 (🔋 $percentage) in "
      else
        echo "🔌 in "
      end
    end
  end
end
