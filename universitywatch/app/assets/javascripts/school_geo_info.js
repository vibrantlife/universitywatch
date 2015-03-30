$(function(){
		

	var callingGoogle = function() {
		var dataCount = school_address.length;
		var result = [];
		for(var i = 0; i < dataCount; i++){
			setTimeout(function(){
					var googleMapAPI = "https://maps.googleapis.com/maps/api/geocode/json?address=" + school_address[i] + "&key=AIzaSyCWsphU3w6xkjfqyTx0gYZ3Hb1vxYyFeBQ";
					  $.getJSON( googleMapAPI, {
					    format: "json"
					  })
					    .done(function(data) {
					    	result.push(data);
					    	console.log(data);
					    }).fail(function(error){
					    	console.log('error');
					    })
			}, 1000);
		}
		console.log(result);
	}
		
})();
