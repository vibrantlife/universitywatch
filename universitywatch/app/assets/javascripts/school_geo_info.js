$(function(){	
	var school_address_array;
	var result = [];
	var School_instance = function() {
		this.lat = '',
		this.lng = '',
		this.school_id = 0
	}

	var callingGoogle = function() {
		var dataCount = school_address_array.length;
		console.log('data count: ' + dataCount );
		var i = 0;
		// for(var i = 0; i < 5; i++){	
			// (function(i){
				var intervaler = setInterval(function(){
						var googleMapAPI = "https://maps.googleapis.com/maps/api/geocode/json?address=" + school_address_array[i].split(' ').join('+') + "&key=AIzaSyCWsphU3w6xkjfqyTx0gYZ3Hb1vxYyFeBQ";
						  $.getJSON( googleMapAPI, {
						    format: "json"
						  })
						    .done(function(data) {
						    	var new_school = new School_instance();
						    	new_school.lat = data.results[0].geometry.location.lat;
						    	new_school.lng = data.results[0].geometry.location.lng;
						    	new_school.school_id = i;
						    	result.push(new_school);
						    	console.log('new_school: ' + new_school); 	
						    	console.log('result lat: ' + result[i-1].lat);
						    	console.log(result.length);
									
						    	$.ajax({
						    		url: '/schools/create_geo_location',
						    		type: 'post',
						    		dataType: 'json',
						    		data: {geoinfo: {lat: result[i-1].lat, lng: result[i-1].lng, id: result[i-1].school_id}}
						    	}).done(function(data){
						    		console.log(data);
						    	}).fail(function(error){
						    		console.log('err');
						    	});
						    }).fail(function(error){
						    	console.log('error');
						    })
						    i += 1;
						    console.log(i);
						    if (i > dataCount){
						    	clearInterval(intervaler);
						    }
				}, 1000);

			// })(i);
			
		// }
		
	}

	$('.run_data').on('click', function(){
		$.ajax({
			url: '/schools/geo_info'
		}).done(function(response){
			school_address_array = response.school_address_array;
			console.log(response);
			callingGoogle();	
		}).fail(function(error){
			console.log('error');
		});
	});	

});
