///@description event_unregister
///@arg event
///@arg id
function event_unregister(argument0, argument1) {

	with(eventmanager){
		var ev = argument0;
		var objID = argument1;
	
		//Get listeners
		if(ds_map_exists(eventMap, ev)){
			var listenerList = eventMap[? ev];
			var len = ds_list_size(listenerList);
		
			var i = 0; repeat(len){
				var listenerInfo = listenerList[| i];
				if(listenerInfo[0] == objID){
					if(len == 1){
						ds_list_destroy(listenerList);
						ds_map_delete(eventMap, ev);
					}else ds_list_delete(listenerList, i);
					break;
				}
				i++;
			}
		}
	}


}
