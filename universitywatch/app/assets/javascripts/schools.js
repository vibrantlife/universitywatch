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
      var context = {state_info: response};
      var html = $('#table_generator').html();
      var templatingFunction = Handlebars.compile(html);
      $('#school_table').append(templatingFunction(context));
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  };


