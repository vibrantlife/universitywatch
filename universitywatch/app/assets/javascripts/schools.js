function drawSchoolResults(stateName, pageNumber, response){
     $('#school_table').data('currentPage', pageNumber);
     $('#school_table').data('stateName', stateName);

     $('#school_table').text('');
      var tableSetup = '<div id="table_generator"><table class="table table-hover"><tr><th>School Name</th><th>School Street</th><th>City, State</th></tr></table></div>';
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
;      $('#dropdown-type').removeAttr('style');
      drawSchoolResults(stateName, pageNumber,response);
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

// pagination shenanigans

$('body').on('loaded:static', function (event) {
  var $button = $('#next');
  var $schoolsDiv = $('#schools');

  _.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
  };

  var schoolsTemplate = _.template($('#schools_template').html());
  var paginationTemplate = _.template($('#pagination_template').html());


  function loadEvents(page) {
    console.log('in static page on function load events');
    $.ajax('/api_historical_events?page=' + page).done(function (data) {
      var context = {paginationTemplate: paginationTemplate, data: data}
      $schoolsDiv.html(schoolsTemplate(context));
      $schoolsDiv.data('currentPage', data.current_page);
    });
  }

  $schoolsDiv.on('click', '.pagination a', function (event) {
    var $link = $(event.target);
    var page = parseInt($link.data('page'));
    if (page) {
      loadEvents(page);
    }
  });


  loadEvents(1);

});


