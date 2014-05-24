CP.module "Views.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->

  class @Hello extends Marionette.ItemView
    template: CPT["user/welcome/hello"]
