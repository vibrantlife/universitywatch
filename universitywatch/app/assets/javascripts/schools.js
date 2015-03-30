// $(document).ready(function(){
//   console.log("here");
//   var map = new Datamap({
//     element: $('#state_container'),
//     scope: 'usa'
//   });
//   $('.datamaps-subunit').on('click', getStateSchools);
// });



  var getStateSchools = function(){
    var classes= $(this).attr("class").split(' ');
    var state = classes[1];
    console.log(state);
    $.ajax({
      url: '/schools/state/' + state,
      type: 'GET',
      dataType: 'json',
    })
    .done(function(response) {
      console.log("success", response);
      $('#school_table').text('');
      var tableSetup = '<div id="table_generator"><table class="table table-hover"><tr><th>School Name</th><th>School Street</th></tr></table></div>';
      $('#school_table').append(tableSetup);
      for(var i=0; i < response.length; i++){
        var handlebarScript = '';
        handlebarScript = '<tr><th><a href="/schools/'+response[i].id+'">'+response[i].name+'</a></th><th>'+response[i].street+'</th></tr>';
        $('.table-hover').append(handlebarScript);
      }
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  };

