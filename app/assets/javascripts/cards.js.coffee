# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $.validator.addMethod 'handCheck', ((hand, element) ->
    hand.split(' ').length == 5
  ), 'Please enter valid cards seperated with space'
  $(".submit_cards").click (event) ->
    event.preventDefault()
    $(".cards_form").validate
      errorClass: 'invalid'
      validClass: 'valid'
      rules:
        "card[data]":
          required: true
      messages:
        "simple_form card":
          required: "This field is required."
    if $(".cards_form").valid()
      $(".cards_form").submit()
    false
