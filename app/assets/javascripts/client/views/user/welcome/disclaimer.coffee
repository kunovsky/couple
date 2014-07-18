CP.module "Views.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->

  class @Disclaimer extends Marionette.ItemView
    template: CPT["user/welcome/disclaimer"]
