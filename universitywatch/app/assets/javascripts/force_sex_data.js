var generatedHeatMap = function(school_weight_array){
	var map, pointarray, heatmap;
			function initialize() {
			  var mapOptions = {
			    zoom: 5,
			    //center: new google.maps.LatLng(37.6, -95.665),
			    center: new google.maps.LatLng(32.6, -85.50),
			    mapTypeId: google.maps.MapTypeId.ROADMAP
			  };

			  map = new google.maps.Map(document.getElementById('heatmap-canvas'),
			      mapOptions);
			  var pointArray = new google.maps.MVCArray(school_weight_array);

			  heatmap = new google.maps.visualization.HeatmapLayer({
			    data: pointArray
			  });

			  heatmap.setMap(map);
			}

		function toggleHeatmap() {
		  heatmap.setMap(heatmap.getMap() ? null : map);
		}

		function changeGradient() {
		  var gradient = [
		    'rgba(0, 255, 255, 0)',
		    'rgba(0, 255, 255, 1)',
		    'rgba(0, 191, 255, 1)',
		    'rgba(0, 127, 255, 1)',
		    'rgba(0, 63, 255, 1)',
		    'rgba(0, 0, 255, 1)',
		    'rgba(0, 0, 223, 1)',
		    'rgba(0, 0, 191, 1)',
		    'rgba(0, 0, 159, 1)',
		    'rgba(0, 0, 127, 1)',
		    'rgba(63, 0, 91, 1)',
		    'rgba(127, 0, 63, 1)',
		    'rgba(191, 0, 31, 1)',
		    'rgba(255, 0, 0, 1)'
		  ]
		  heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
		}

		function changeRadius() {
		  heatmap.set('radius', heatmap.get('radius') ? null : 20);
		}

		function changeOpacity() {
		  heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
		}

		google.maps.event.addDomListener(window, 'click', initialize());
}

$(function(){
	var school_weight_data = [];
	var i = -1;
	var intervaler = setInterval(function(){
		$.ajax({
				url: '/schools/heatmap_data'
			}).done(function(response){
				var new_data = { location: new google.maps.LatLng(response.school_data_weight_array[i][0], response.school_data_weight_array[i][1]), weight: response.school_data_weight_array[i][2]};
				school_weight_data.push(new_data);
			}).fail(function(error){
				console.log('error');
			});
			i += 1;
			if (i == 49){
				clearInterval(intervaler);
				console.log('success');
			}
		}, 100);

	$('body').on('click', '.run_heatmap_data', function(){
		generatedHeatMap(school_weight_data);
		console.log(school_weight_data);
		var weight_data = JSON.stringify(school_weight_data);
		$.ajax({
			url: '/heatmaps/store_array',
			type: 'post',
			dataType: 'json',
			data: {weight_data: weight_data}
		}).done(function(callback){
			console.log(callback);
			console.log('why success');
		}).fail(function(error){
			console.log('why error');
		});
		console.log('click run_heatmap_data');
	});

	$('body').on('click', '.show_heatmap', function(){
		$.ajax({
			url: '/heatmaps/show',
		}).done(function(arrayFromServer){
			//generatedHeatMap(arrayFromServer);
			console.log('success');
		}).fail(function(error){
			console.log('error');
		});
		console.log('click');
	});

});