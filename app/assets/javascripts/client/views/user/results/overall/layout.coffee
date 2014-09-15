CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/overall/layout"]

    regions:
      resultRegion: "#result-region"
      inviteRegion: "#invite-region"

    onRender: ->
      @resultRegion.show new Overall.Result
      # @inviteRegion.show new Overall.Invite