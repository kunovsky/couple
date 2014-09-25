CP.module "Views.User.Welcome.MoreInfo", (MoreInfo, CP, Backbone, Marionette, $, _) ->

  class @Explanation extends Marionette.ItemView
    template: CPT["user/welcome/more_info/info_base"]
    events: 'click .js-modal' : 'openModal'
    name: "Why This Works"

    templateHelpers: -> {@name}

    openModal: -> CP.modalRegion.show new MoreInfo.Modals.Explanation