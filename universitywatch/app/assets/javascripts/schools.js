$(document).ready(function(){
  console.log("here");
  $('.datamaps-subunit').click(function(){
    console.log("state!")
    // console.log($(this).attr("class").last());
    var classes= $(this).attr("class").split(' ');
    var state = classes[1];
  });
});
