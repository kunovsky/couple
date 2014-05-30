CP.module "Views.Results", (Results, App, Backbone, Marionette, $, _) ->

  class @CompositeScore extends Marionette.ItemView
    template: CPT["user/results/composite_score"]