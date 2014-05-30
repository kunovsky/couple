CP.module "Views.Results", (Results, App, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/layout"]

    regions:
      individualScoresRegion: "#individual-region"
      compositeScoreRegion: "#composite-region"
 

    onRender: ->
      @individualScoresRegion.show new CP.Views.Results.IndividualScores
      @compositeScoreRegion.show new CP.Views.Results.CompositeScore