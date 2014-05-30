CP.module "Views.Results", (Results, App, Backbone, Marionette, $, _) ->

  class @IndividualScores extends Marionette.ItemView
    template: CPT["user/results/individual_score"]