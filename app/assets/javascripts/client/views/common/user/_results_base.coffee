CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @ResultsBase extends Backbone.Marionette.Layout
    template: CPT['common/results/layout']

    regions:
      scoresRegion: "#scores-region"
      contentRegion: "#content-region"

    onRender: ->
      @scoresRegion.show new User.Results.Scores url: @scoresUrl(), name: @name
      @contentRegion.show new User.Results.Content url: @contentUrl(), name: @name