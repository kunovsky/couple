CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Video extends Backbone.Marionette.ItemView
    template: CPT["user/welcome/video"]