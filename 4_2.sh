#!/bin/bash
read -s -p "Enter the password: " pass
echo ""
if [[ ${#pass} -lt 8  ]]; then
	echo "WEAK PASSWORD: (less than 8 characters)"
elif [[ $pass != *[0-9]*  ]]; then
	echo "WEAK PASSWORD: (contain atleast 1 number)"
elif [[ $pass != *[@\#$\%\&\*\+\-=]*  ]]; then
	echo "WEAK PASSWORD: (contain atleast one of @, #, $, %, &, *,+, -, =)"
else
	echo $pass
	echo "STRONG PASSWORD"
fi



