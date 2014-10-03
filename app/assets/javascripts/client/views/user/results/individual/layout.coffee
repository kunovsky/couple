CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/individual/layout"]

    regions:
      generalRegion: "#general-region"
      friendshipRegion: "#friendship-region"
      fondnessRegion: "#fondness-region"
      turningRegion: "#turning-region"
      emotionRegion: "#emotion-region"

    onRender: ->
      @generalRegion.show new Individual.General
      @friendshipRegion.show new Individual.Friendship
      @fondnessRegion.show new Individual.Fondness
      @turningRegion.show new Individual.Turning
      @emotionRegion.show new Individual.Emotion