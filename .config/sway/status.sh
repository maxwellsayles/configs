power_status=$(cat /sys/class/power_supply/BAT0/status)
power_percent=$(cat /sys/class/power_supply/BAT0/capacity)
power=$(echo ${power_percent}% $power_status)
date=$(date +'%Y-%m-%d')
time=$(date +'%l:%M %p')

# Emojis https://unicode.org/emoji/charts/full-emoji-list.html
echo "🔋 $power  📅 $date  🧭 $time  "
