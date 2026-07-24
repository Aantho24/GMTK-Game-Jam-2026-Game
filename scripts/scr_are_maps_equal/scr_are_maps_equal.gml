function are_maps_equal(map1, map2) {
	if ds_map_size(map1) != ds_map_size(map2) {
	    return false;
	}

	for (var k = ds_map_find_first(map1); !is_undefined(k); k = ds_map_find_next(map1, k)) {
	    if !ds_map_exists(map2, k) {
	        return false;
	    }
   
	    if map1[?k] != map2[?k] {
	        return false;
	    }
	}

	return true;
}