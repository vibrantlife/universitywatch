$(document).on('ready page:load', function () {
  $(".search-bar").on("keyup", function(event){
    var data = $(this).val();
    if (data.length > 2){
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
    } else {
      console.log("first 3 letters")
    }
  });
});
