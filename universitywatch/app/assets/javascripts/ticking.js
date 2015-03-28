$(function(){
	function ticking(queryStat,endValue, speed){
		setInterval(function(){
			var value = parseInt($(queryStat).html());
			if(value < endValue){
				value++;
			}
			$(queryStat).html(value);
		}, speed);
	}
	ticking('.murder-odo', 100, 100);
	
});