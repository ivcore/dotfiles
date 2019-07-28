#!/usr/bin/env bash

# Print pretty colors to the stdout
printf "\\n"
i=0
while [[ $i -le 6 ]]; do
	printf "\\e[$((i+41))m\\e[$((i+30))m█▓▒░"
	i=$((i+1))
done
printf "\\e[37m█\\e[0m▒░\\n\\n"
