CP.module "Views.User.Welcome.MoreInfo.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Privacy extends Modals.Base
    template: CPT["user/welcome/more_info/modals/privacy"]