CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @WelcomeBase extends Marionette.ItemView
    events: 'click .js-begin-questionnaire' : 'beginQuestionnaire'

    beginQuestionnaire: (e) ->
      e.preventDefault()
      $.ajax
        type: 'POST'
        url: '/sessions'
        success: (respObj) => 
          window.location.href = respObj.path
