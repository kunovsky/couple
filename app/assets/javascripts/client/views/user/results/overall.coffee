CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Overall extends Marionette.ItemView
    template: CPT["user/results/overall"]