$(function(){
	var school_weight_data = [],
	    heatmap_objects_array = [],
	    final_array = [];

	var get_array_from_server = function(){
		$.ajax({
			url: '/heatmaps/show',
		}).done(function(arrayFromServer){
			heatmap_objects_array = arrayFromServer;
			console.log('success');
			show_map();
		}).fail(function(error){
			console.log('error');
		});
	}

	var show_map = function(){
		var lat, lng, weight;
		for(var i = 0; i < 3591; i++){
			lat = parseFloat(heatmap_objects_array[i][0]);
			lng = parseFloat(heatmap_objects_array[i][1]);
			weight = parseFloat(heatmap_objects_array[i][2]);
			var new_data = { location: new google.maps.LatLng(lat, lng), weight: weight}
			final_array.push(new_data);
		}
			generatedHeatMap(final_array);
	}
	
	get_array_from_server();
});

