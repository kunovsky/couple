CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/layout"]

    regions:
      inviteRegion: "#invite-region"
      generalRegion: "#general-region"
      friendshipRegion: "#friendship-region"
      fondnessRegion: "#fondness-region"
      turningRegion: "#turning-region"
      emotionRegion: "#emotion-region"
      overallRegion: "#overall-region"

    initialize: ->
      @listenTo CP.vent, 'show:partnerInvited', @partnerInvited
      @fetchNextStep()

    onRender: ->
      @inviteRegion.show new @inviteRegionType if @inviteRegionType
      @generalRegion.show new Results.Sections.General
      @friendshipRegion.show new Results.Sections.Friendship
      @fondnessRegion.show new Results.Sections.Fondness
      @turningRegion.show new Results.Sections.Turning
      @emotionRegion.show new Results.Sections.Emotion
      @overallRegion.show new Results.Sections.Overall

    fetchNextStep: ->
      $.ajax
        method: 'GET'
        url: ['api', 'users', CP.CurrentUser.get('id'), 'invite_status'].join('/')
        success: (response) => 
          @chooseView(response)
          @render()

    chooseView: (response) ->
      return @inviteRegionType = Results.Invites.InviteOptions if !response.partner_invited
      return @inviteRegionType = Results.Invites.PartnerInvited if !response.partner_taken
      @inviteRegionType = Results.Invites.BothTaken

    partnerInvited: -> 
      @inviteRegion.show new Results.Invites.PartnerInvited