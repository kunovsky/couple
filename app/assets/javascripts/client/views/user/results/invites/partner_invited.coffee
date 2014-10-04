CP.module "Views.User.Results.Invites", (Invites, CP, Backbone, Marionette, $, _) ->
  
  class @PartnerInvited extends Backbone.Marionette.ItemView
    template: CPT["user/results/invites/partner_invited"]