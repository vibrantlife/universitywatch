function drawSchoolResults(stateName, pageNumber, response){
     $('#school_table').data('currentPage', pageNumber);
     $('#school_table').data('stateName', stateName);

     $('#school_table').text('');
      var tableSetup = '<div id="table_generator"><table class="table table-hover"><tr class="state-chart-header"><th>School Name</th><th>School Street</th><th>City, State</th></tr></table></div>';
      $('#school_table').append(tableSetup);
      for(var i=0; i < response.entries.length; i++){
        var handlebarScript = '';
        handlebarScript = '<tr><th><a href="/schools/'+response.entries[i].id+'">'+response.entries[i].name+'</a></th><th>'+response.entries[i].street+'</th><th>' + response.entries[i].city + ', ' + response.entries[i].state + '</th></tr>';
        $('.table-hover').append(handlebarScript);
      }
}

// get list of all schools for state
  var getStateSchools = function(stateName, pageNumber){
    $.ajax({
      url: '/schools/state/' + stateName + '/?page=' + pageNumber ,
      type: 'GET',
      dataType: 'json',
    })
    .done(function(response) {
      console.log("success", response.entries);
// ;      $('#dropdown-type').removeAttr('style');
      drawSchoolResults(stateName, pageNumber,response);
      // $('#dropdown-type').on('click', 'a', getSchoolsByType(stateName));
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

//filtering schools by type
var getSchoolsByType = function(stateName){
  var type = $(this).text();
  console.log(stateName, type);
  $.ajax({
    url: '/schools/state/' + stateName + '/' + type,
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
