CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Explanation extends Marionette.ItemView
    template: CPT["user/welcome/explanation"]
