CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @WelcomeBase extends Marionette.ItemView
    url: ['questionnaire', '1'].join('/')
    events: 'click .js-begin-questionnaire' : 'beginQuestionnaire'

    beginQuestionnaire: (e) ->
      e.preventDefault()
      $.ajax
        type: 'POST'
        url: '../sessions'
        success: => 
          CP.ActiveRouters.User.navigate @url, true
