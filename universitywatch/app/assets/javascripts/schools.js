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
      var handlebarScript = '';
      for(var i=0; i < response.length; i++){
        handlebarScript = '<div class="row"><script id="table_generator" type="text/x-handlebars-template"><table class="table table-hover"><tr><th>School Name</th><th>School Street</th></tr>{{#each state_info}}<tr><th><a href="/schools/'+response[i].id+'">{{name}}</a></th><th>{{street}}</th></tr>{{/each}}</table></script></div>';
      }

      $('#school_table').append(handlebarScript);
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


