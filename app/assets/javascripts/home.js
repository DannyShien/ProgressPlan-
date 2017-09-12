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
})

