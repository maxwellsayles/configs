power_status=$(cat /sys/class/power_supply/BAT0/status)
power_percent=$(cat /sys/class/power_supply/BAT0/capacity)
power=$(echo ${power_percent}% $power_status)
now=$(date +'%Y-%m-%d %l:%M:%S %p')

echo 🐧 $power 🔋 $now
