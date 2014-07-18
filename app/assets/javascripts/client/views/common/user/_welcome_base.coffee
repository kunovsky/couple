CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @WelcomeBase extends Marionette.ItemView
    events :
      'click .js-begin-questionnaire' : 'beginQuestionnaire'

    beginQuestionnaire: (e) ->
      e.preventDefault()
      CP.ActiveRouters.User.navigate 'questionnaire', true
