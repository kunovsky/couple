CP.module "Views.User.Welcome.MoreInfo.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Research extends Marionette.ItemView
    template: CPT["user/welcome/more_info/modals/research"]
