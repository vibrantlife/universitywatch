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

	ticking('.auto-odo', 3261, 40);
	ticking('.assaults-odo', 2303, 40);
	ticking('.forcible-odo', 5052, 40);
	ticking('.robbery-odo', 1568, 40);

});

