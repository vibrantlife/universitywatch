$(function(){
	setInterval(function(){
		var value = parseInt($('.murder-odo').html());
		if(value < 100){
			value++;
		}
		$('.murder-odo').html(value);
	}, 100);
});