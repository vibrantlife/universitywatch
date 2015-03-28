$(function(){
	var ticking = function(queryStat,endValue, speed){
		setInterval(function(){
			var value = parseInt($(queryStat).html());
			if(value < endValue){
				value++;
			}
			$(queryStat).html(value);
		}, speed);
	}
	ticking('.murder-odo', 100, 80);
	ticking('.assaults-odo', 2000, 5);
	ticking('.sexual-odo', 89, 90);
	ticking('.women-assault-odo', 345, 50);

});