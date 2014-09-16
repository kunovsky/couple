CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/overall/layout"]
    regions:
      resultRegion: "#result-region"
      inviteRegion: "#invite-region"

    initialize: ->
      @listenTo CP.vent, 'show:next', @nextStep

    onRender: ->
      @resultRegion.show new Overall.Result delegate: @

    nextStep: (step) ->
      return @inviteRegion.show new Overall.InviteOptions if step.inviteOptions
      @inviteRegion.show new Overall.PartnerInvited if step.partnerInvited
