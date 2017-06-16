// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {
  console.log("ready");
  $("#addNewQuestion").on("click", function() {
    console.log("QUESTION LISTEN")
    $("#questions").append($("#new_question_form").html());

    this.removeQuestion = function(element) {}
    return element.parent().remove();
  });
  $("#addNewChoice").on("click", function() {
    console.log("on listen");
   $("#poll_choices").append($("#new_choice_form").html());

    this.removeChoice = function(element) {};
    return element.parent().remove();
  });

})
