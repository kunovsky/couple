CP.module "Views.User.Welcome.MoreInfo", (MoreInfo, CP, Backbone, Marionette, $, _) ->

  class @Process extends MoreInfo.Base
    name: "How It Works"

    openModal: -> CP.modalRegion.show new MoreInfo.Modals.Process