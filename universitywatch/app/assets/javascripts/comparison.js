$(function(){
  $('#compare_btn').on('click', function(){
    var firstSchool = $('#first-school').val();
    var secondSchool = $('#second-school').val();

    $.ajax({
      url: '/schools/compare_two',
      type: 'GET',
      dataType: 'json',
      data: {first_school: firstSchool, second_school: secondSchool}
    })
    .done(function(response) {
      console.log(response);

    })
    .fail(function() {
      console.log("error");
    })

  });


})
