var generatedHeatMap = function(school_weight_array){
	var map, pointarray, heatmap;
			function initialize() {
			  var mapOptions = {
			    zoom: 4,
			    center: new google.maps.LatLng(37.6, -95.665),
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
		 ];
		google.maps.event.addDomListener(window, 'click', initialize());

		heatmap.set('gradient', gradient);
		heatmap.set('radius', 20);

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

}