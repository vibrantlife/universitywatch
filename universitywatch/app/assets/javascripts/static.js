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
