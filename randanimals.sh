arr=$(cowsay -l)
len=${#arr[@]}

list[0]="COWSAY"
i=1
for word in $arr; do
	list[i]=$word
	#echo "$word -- ${list[$i]}"
	i=$((i+1))
done

lenA=${#list[@]}
lenA=$((lenA-5)) 
#echo "length of list ===== $lenA"

rand_num=$(( (RANDOM % lenA) + 5 ))

#echo "$rand_num ========> ${list[rand_num]}"
fortune ~/Documents/Projects/fortunes/fortunes | cowsay -f ${list[rand_num]}
