CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Invite extends Backbone.Marionette.ItemView
    template: CPT["user/results/invite"]