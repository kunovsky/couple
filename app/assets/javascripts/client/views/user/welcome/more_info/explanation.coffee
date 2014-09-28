CP.module "Views.User.Welcome.MoreInfo", (MoreInfo, CP, Backbone, Marionette, $, _) ->

  class @Explanation extends MoreInfo.Base
    name: "Why It Works"
    
    openModal: -> CP.modalRegion.show new MoreInfo.Modals.Explanation