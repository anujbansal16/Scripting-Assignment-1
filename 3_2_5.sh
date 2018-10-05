awk 'BEGIN{
print ""
print "*** Grade Report for the ABC course ***"
print ""
print "Name	Gender	Mid1	Mid2	Endsem	Total	Grade"
highest=0
lowest=200
allStudentsMarksSum=0;
}
NR!=1 {
total=$3+$4+$5;
allStudentsMarksSum+=total
if(highest<total)
	highest=total
if(lowest>total)
	lowest=total

if(total>=95)
	grade="A"
else if(total>=90)
	grade="A-"
else if(total>=85)
	grade="B"
else if(total>=80)
	grade="B-"
else if(total>=75)
	grade="C"
else if(total>=70)
	grade="C-"
else if(total>=60)
	grade="D"
else if(total<60)
	grade="F"
	print $1."	",$2."	",$3."	",$4."	",$5."	",total,"	",grade
}END{
print ""
avg=allStudentsMarksSum/(NR-1)
print "Total no. of students: ",NR-1
print "Highest Marks: ",highest
print "Lowest Marks: ",lowest
print "Average Marks: ",avg
print ""
print "*** End of Grade Report ***"
print ""
}' marks.txt