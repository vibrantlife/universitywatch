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

	ticking('.auto-odo', 3261, 10);
	ticking('.assaults-odo', 2303, 10);
	ticking('.forcible-odo', 5052, 10);
	ticking('.robbery-odo', 1568, 10);

});

