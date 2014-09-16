CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->
  
  class @PartnerInvited extends Backbone.Marionette.ItemView
    template: CPT["user/results/overall/partner_invited"]