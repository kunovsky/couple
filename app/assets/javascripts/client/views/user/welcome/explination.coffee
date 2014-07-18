CP.module "Views.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->

  class @Explination extends Marionette.ItemView
    template: CPT["user/welcome/explination"]
