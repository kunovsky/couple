CP.module "Views.User.Welcome.MoreInfo", (MoreInfo, CP, Backbone, Marionette, $, _) ->

  class @Privacy extends MoreInfo.Base
    name: "Your Privacy"

    openModal: -> CP.modalRegion.show new MoreInfo.Modals.Privacy