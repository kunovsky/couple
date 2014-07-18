CP.module "Views.User", (User, CP, Backbone, Marionette, $, _) ->
  class @Header extends Backbone.Marionette.ItemView
    template: CPT['user/header']

