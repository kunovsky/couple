CP.module "Views.User.Welcome.MoreInfo", (MoreInfo, CP, Backbone, Marionette, $, _) ->

  class @Research extends MoreInfo.Base
    name: "The Research"

    openModal: -> CP.modalRegion.show new MoreInfo.Modals.Research