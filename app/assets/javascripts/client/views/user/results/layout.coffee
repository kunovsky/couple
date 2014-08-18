CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/layout"]

    regions:
      individualRegion: "#individual-region"
      overallRegion: "#overall-region"

    onRender: ->
      @individualRegion.show new Results.Individual.Layout
      @overallRegion.show new Results.Overall