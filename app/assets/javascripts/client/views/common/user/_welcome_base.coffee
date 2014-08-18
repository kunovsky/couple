CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @WelcomeBase extends Marionette.ItemView
    events :
      'click .js-begin-questionnaire' : 'beginQuestionnaire'
    url : ['questionnaire', '1'].join('/')

    beginQuestionnaire: (e) ->
      e.preventDefault()
      CP.ActiveRouters.User.navigate @url, true
