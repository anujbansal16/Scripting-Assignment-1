awk 'BEGIN{print "[" > "imdb-top-250.json"}{
name=""
for(i=2;i<=NF-2;i++){
	name=name" "$i;
}
name=name" "
id=substr($1,1,length($1)-1);
id="\"ID\" : " "\""id"\""

name="\"Name\" : " "\""name  "\""

Year=substr($(NF-1),2,4);
Year="\"Year\" : " "\"" Year "\""

rating=$(NF);
rating="\"Rating\" : " "\"" rating "\""

if(NR<250)
	printf(" {\n %s ,\n %s ,\n %s ,\n %s\n } ,\n", id,name,Year,rating) > "imdb-top-250.json"
else
	printf(" {\n %s ,\n %s ,\n %s ,\n %s\n }\n", id,name,Year,rating) > "imdb-top-250.json"

}END{print "]" > "imdb-top-250.json"}' imdb-top-250.txt