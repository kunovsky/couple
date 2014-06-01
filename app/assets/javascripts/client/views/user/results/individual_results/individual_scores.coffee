CP.module "Views.Results", (Results, App, Backbone, Marionette, $, _) ->

  class @IndividualScores extends Marionette.CompositeView
    itemView: Results.IndividualScore
    template: CPT["user/results/individual_scores/individual_scores"]