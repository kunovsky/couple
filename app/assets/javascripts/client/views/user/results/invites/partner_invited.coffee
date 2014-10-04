CP.module "Views.User.Results.Invites", (Invites, CP, Backbone, Marionette, $, _) ->
  
  class @PartnerInvited extends Backbone.Marionette.ItemView
    template: CPT["user/results/invites/partner_invited"]

    onRender: ->
      $(@el).find(".invite__container").addClass("result--good")