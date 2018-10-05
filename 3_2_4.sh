#! /bin/sh
export temp=0
awk '
BEGIN{
	max=0;
	allStudentsMarksSum=0
	print "Topper Info: "
	print "Name	Total"
}
{
NR>1
{
total=$3+$4+$5
st[$1]=total;
allStudentsMarksSum+=total
if(max<total){
	topper=$1;
	max=$3+$4+$5;
	$temp=max
}
}
}
END{ print topper,"	",max
avg=allStudentsMarksSum/(NR-1)
print ""
print "Students scored above class average"
	for(student in st){
		if(st[student]>avg)
			print student,"	",st[student]
	}
}' marks.txt 
