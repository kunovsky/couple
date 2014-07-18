CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Explination extends Marionette.ItemView
    template: CPT["user/welcome/explination"]
