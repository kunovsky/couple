CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/layout"]

    regions:
      inviteRegion: "#invite-region"
      overallRegion: "#overall-region"
      generalRegion: "#general-region"
      friendshipRegion: "#friendship-region"
      fondnessRegion: "#fondness-region"
      turningRegion: "#turning-region"
      emotionRegion: "#emotion-region"
      
    initialize: ->
      @listenTo CP.vent, 'show:next', @nextStep

    onRender: ->
      @overallRegion.show new Results.Sections.Overall delegate: @
      @generalRegion.show new Results.Sections.General
      @friendshipRegion.show new Results.Sections.Friendship
      @fondnessRegion.show new Results.Sections.Fondness
      @turningRegion.show new Results.Sections.Turning
      @emotionRegion.show new Results.Sections.Emotion

    nextStep: (step) ->
      return @inviteRegion.show new Results.Invites.InviteOptions if step.inviteOptions
      @inviteRegion.show new Results.Invites.PartnerInvited if step.partnerInvited