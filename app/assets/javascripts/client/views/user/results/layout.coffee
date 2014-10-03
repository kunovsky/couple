CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/layout"]

    regions:
      overallRegion: "#overall-region"
      individualRegion: "#individual-region"
      

    onRender: ->
      @overallRegion.show new Results.Overall.Layout
      @individualRegion.show new Results.Individual.Layout