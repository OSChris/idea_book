# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#new-idea-btn").click ->
    if ($("#create-form").is(":hidden"))
      $("#create-form").slideDown("slow")
      $("#new-idea-btn").text("Cancel New Idea")
    else
      $("#create-form").slideUp("slow")
      $("#new-idea-btn").text("New Idea")
    false
