$(document).ready(function(){
  var crimeDefs = $('.definition-text');

  crimeDefs.hide();
//index 3 is important here
  $('.crime-btn').click(function(e) {
    e.preventDefault();
    var definitionClass = ($(this).attr("class").split(" ")[3] + "-def");
    var crimeDescriptionSelector = "."+ $(definitionClass).selector
    $(crimeDescriptionSelector).slideToggle( "slow" );
  });
});