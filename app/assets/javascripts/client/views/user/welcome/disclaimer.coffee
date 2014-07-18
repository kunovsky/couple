CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Disclaimer extends CP.Views.Common.User.WelcomeBase
    template: CPT["user/welcome/disclaimer"]
  