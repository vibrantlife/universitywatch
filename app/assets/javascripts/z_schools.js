$(function(){
  var school_table = $('#school_table'),
      tableSetup = '<div id="table_generator"><table class="table table-hover"><tr><th>School Name</th><th>School Street</th><th>City, State</th></tr></table></div>',
      handlebarScript = '',
      clear_school_table = school_table.text(''),
      prev = $('#previous'),
      next = $('#next');

  var handlebarScriptFunc = function(collectionofSchool, idx){
    return '<tr><th><a href="/schools/'+collectionofSchool[idx].id+'">'+collectionofSchool[idx].name+'</a></th><th>'+collectionofSchool[idx].street+'</th><th>' + collectionofSchool[idx].city + ', ' + collectionofSchool[idx].state + '</th></tr>';
  }

  var iterateCollections = function(counter, collectionofSchool){
    for(var i=0; i < counter; i++){
        handlebarScript = '';
        handlebarScript = handlebarScriptFunc(collectionofSchool, i);
        $('.table-hover').append(handlebarScript);
    }
  }

  var drawSchoolResults = function(stateName, pageNumber, response){
        school_table.data('currentPage', pageNumber);
        school_table.data('stateName', stateName);
        school_table.text('');
        school_table.append(tableSetup);

      var collectionofSchool = response.entries,
          count_of_school = collectionofSchool.length;

      iterateCollections(count_of_school, collectionofSchool);
  };

  // get list of all schools for state
  var getStateSchools = function(stateName, pageNumber){
    $.ajax({
      url: '/schools/state/' + stateName + '/?page=' + pageNumber,
      type: 'GET',
      dataType: 'json',
    })
    .done(function(response) {
      console.log("success", response.entries);
      drawSchoolResults(stateName, pageNumber,response);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  };

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
      clear_school_table;
      school_table.append(tableSetup);
      iterateCollections(schoolsTypeData.length, schoolsTypeData);
    })
    .fail(function() {
      console.log("error");
    });
  }

  prev.hide();
  next.hide();

  var state_map = new Datamap({
    element: $('#state_container')[0],
    scope: 'usa'
  });
  $('.datamaps-subunit').on('click', function(){
    prev.show();
    next.show();
      var $state = $(this);
      var classes= $state.attr("class").split(' ');
      var stateName = classes[1];
      getStateSchools(stateName, 1);

      // Scroll down to the Table when state is clicked:
      $('body').animate({
          scrollTop: school_table.offset().top},
          'slow');
  });

  next.click(function(){
      var currentPage = parseInt(school_table.data('currentPage'));
      var stateName = school_table.data('stateName');

      getStateSchools(stateName, currentPage + 1);
    });

  prev.click(function(){
     var currentPage = parseInt(school_table.data('currentPage'));
     var stateName = school_table.data('stateName');

     getStateSchools(stateName, currentPage - 1);
   });

});