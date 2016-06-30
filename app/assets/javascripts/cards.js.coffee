# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$->
  $(".simple_form.card").validate
    errorClass: 'invalid'
    validClass: 'valid'
    rules:
      "card[data]":
        required: true
    messages:
      "simple_form card":
        required: "This field is required."
  if $(".simple_form.card").valid()
    $(".simple_form.card").submit()
  false
