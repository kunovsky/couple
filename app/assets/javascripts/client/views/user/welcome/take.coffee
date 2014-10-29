CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Take extends Marionette.ItemView
    template: CPT["user/welcome/take"]
    events: 
      'click .js-begin-questionnaire' : 'beginQuestionnaire'

    beginQuestionnaire: (e) -> CP.modalRegion.show new Welcome.BeginModal