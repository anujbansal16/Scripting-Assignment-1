ifconfig | sed -n  's/\(.*\)\(\([a-f0-9]\{2\}[-\:]\)\{5\}[a-f0-9]\{2\}\)/\2/gp'