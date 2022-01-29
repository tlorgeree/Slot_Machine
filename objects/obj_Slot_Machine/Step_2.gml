//calc total active rows
if (active_calc){
	active_total = 0;
	for(var i = 0; i<5; i++){
		if (active[i] == 1) active_total++;
	}
}
active_calc = false;