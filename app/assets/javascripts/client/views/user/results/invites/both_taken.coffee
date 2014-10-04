CP.module "Views.User.Results.Invites", (Invites, CP, Backbone, Marionette, $, _) ->
  
  class @BothTaken extends Backbone.Marionette.ItemView
    template: CPT["user/results/invites/both_taken"]