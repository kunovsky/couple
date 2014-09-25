CP.module "Views.User.Welcome.MoreInfo.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Process extends Marionette.ItemView
    template: CPT["user/welcome/more_info/modals/process"]
