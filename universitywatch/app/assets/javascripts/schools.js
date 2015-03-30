// $(document).ready(function(){
//   console.log("here");
//   var map = new Datamap({
//     element: $('#state_container'),
//     scope: 'usa'
//   });
//   $('.datamaps-subunit').on('click', getStateSchools);
// });



// get list of all schools for state
  var getStateSchools = function(){
    var classes= $(this).attr("class").split(' ');
    state = classes[1];
    $.ajax({
      url: '/schools/state/' + state,
      type: 'GET',
      dataType: 'json',
    })
    .done(function(response) {
      // console.log("success", response);
      $('#dropdown-type').removeAttr('style');
      $('#school_table').text('');
      var tableSetup = '<div id="table_generator"><table class="table table-hover"><tr><th>School Name</th><th>School Street</th><th>City, State</th></tr></table></div>';
      $('#school_table').append(tableSetup);
      for(var i=0; i < response.length; i++){
        var handlebarScript = '';
        handlebarScript = '<tr><th><a href="/schools/'+response[i].id+'">'+response[i].name+'</a></th><th>'+response[i].street+'</th><th>' + response[i].city + ', ' + response[i].state + '</th></tr>';
        $('.table-hover').append(handlebarScript);
      }
      $('#dropdown-type').on('click', 'a', getSchoolsByType);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  };

//get schools based on state and type
// we need to get the state
// get the type from text between a tags


// var getSchoolsByType = function(){
//   // $('#dropdown-type').on('click', 'a', console.log('dropdown clicked'));
//   console.log('working function');
// }

// search bar
$(document).ready(function(){
  $(".search-bar").on("keyup", function(){
    var data = $(".search-bar").val();
    url = "/schools/json_search/" + data;
    $.ajax({
      url: url
    })
    .done(function(response){
      console.log(response)
      availableTags = [];
      for (var i = 0; i < response.length; i++){
        availableTags.push(response[i].name);
      }
      $(".search-bar").autocomplete({
        source: availableTags
      });
    })
    .fail(function(){
      console.log("fail")
    })
  });

});


var getSchoolsByType = function(){
  var type = $(this).text();
  console.log(state);
  $.ajax({
    url: '/schools/state/' + state + '/' + type,
    type: 'GET',
    dataType: 'json',
  })
  .done(function(schoolsTypeData) {
    $('#school_table').text('');
    var tableSetup = '<div id="table_generator"><table class="table table-hover"><tr><th>School Name</th><th>School Street</th><th>City, State</th></tr></table></div>';
    $('#school_table').append(tableSetup);
    for(var i=0; i < schoolsTypeData.length; i++){
      var handlebarScript = '';
      handlebarScript = '<tr><th><a href="/schools/'+schoolsTypeData[i].id+'">'+schoolsTypeData[i].name+'</a></th><th>'+schoolsTypeData[i].street+'</th><th>' + schoolsTypeData[i].city + ', ' + schoolsTypeData[i].state + '</th></tr>';
      $('.table-hover').append(handlebarScript);
    }
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

}


