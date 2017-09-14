// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
  $(".js-show-modal").on("click", function(){    
    $(".modal").addClass("is-active");
  })

  $("button.delete").on("click", function() {
    $(".modal").removeClass("is-active");
  })
            
  $("div.modal-background").on("click", function() {
    $(".modal").removeClass("is-active");  
  })    

  // $("button.flash-delete").on("click", function(){
  //   $("div.message").removeClass("is-active");
  // })

   bind_goal_click_event = function() {
    $(".card-goals").click(function(e) {
      var data = $(e.target).parents(".card-goals").attr("data-id")
      $("#goal_" + data).toggle("hidden")
    })
   };

   bind_goal_click_event();

  $('.add-task').click(function(e) {
    var goal_id = $(e.target).first().data('goal-id');
    $(`#add_task_goal_${goal_id}`).addClass('is-active');
  })
})
