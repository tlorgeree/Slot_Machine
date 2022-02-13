function In_1D_Array(array,target){//Returns boolean
	var output = false;
	for(var i = 0; i<array_length(array);++i){
		if (array_equals(array[i],target)) output = true;
		
	}
	return output;
}