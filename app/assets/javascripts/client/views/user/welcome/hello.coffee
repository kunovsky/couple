CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Hello extends CP.Views.Common.User.WelcomeBase
    template: CPT["user/welcome/hello"]
