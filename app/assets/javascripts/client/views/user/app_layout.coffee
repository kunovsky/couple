CP.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  class @AppLayout extends Marionette.Layout
    template: CPT["user/layout"]

    regions:
      welcomeRegion: "#welcome-region"
      quizRegion: "#quiz-region"
      resultsRegion: "#results-region"
      moreRegion: "#more-region"


    onRender: ->
      @welcomeRegion.show new CP.Views.Welcome.Layout
      @quizRegion.show new CP.Views.Quiz.Layout
      # @resultsRegion.show new CP.Views.Results.Layout
      # @moreRegion.show new CP.Views.More.Layout