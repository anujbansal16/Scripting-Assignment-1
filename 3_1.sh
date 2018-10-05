awk 'BEGIN{i=0}{
	a[$0]=1;

}END{
	for(x in a){
		print x
	}
}' $1