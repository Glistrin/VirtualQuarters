function ScriptExecute_array(scr, args) {
	var s = scr 
	var a = args

	switch(array_length(args)) {
		case 1: script_execute(s, a[0]); break;
		case 2: script_execute(s, a[0], a[1]); break;
		case 3: script_execute(s, a[0], a[1], a[2]); break;
		case 4: script_execute(s, a[0], a[1], a[2], a[3]); break;
		case 5: script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
		case 6: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
		case 7: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
		case 8: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
		case 9: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
   	   case 10: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
   	   case 11: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
   	   case 12: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
   	   case 13: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
   	   case 14: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
   	   case 15: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
   	   case 16: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]); break;
	} 

}



function array_max(array)  {
	var _max = 0
	for (var i = 0; i < array_length(array) ; i++) {
	    if (array[i] > _max)
	    {
	       _max = array[i]
	    }
	}
	return _max
}

global.tracker = 0
global.trackeeer = 0