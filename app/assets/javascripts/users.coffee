# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
    $('#new_user').validate
        debug: true
        rules:
          'user[first_name]':
            required: true
            minlength: 3
          'user[last_name]':
            required: true
            minlength: 3
          'user[email]':
            required: true
            email: true
          'user[password]':
            required: true
            minlength: 6
          'user[password_confirmation]':
            required: true
            equalTo: '#password'
          'user[github]':
            required: true
            url: true
          'user[mobile_number]':
            required: true
            digits: true
            minlength: 10
        messages: {
            'user[mobile_number]':{
                required: "We need a way to reach you"
                digits: "Please enter a valid phone number"
                minlength: "Invalid phone number"
            }
        }

