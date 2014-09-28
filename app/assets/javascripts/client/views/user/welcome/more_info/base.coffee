CP.module "Views.User.Welcome.MoreInfo", (MoreInfo, CP, Backbone, Marionette, $, _) ->

  class @Base extends Marionette.ItemView
    template: CPT["user/welcome/more_info/base"]
    events: 'click .js-modal' : 'openModal'

    templateHelpers: -> {@name}

    #TODO: Remove all these views and just use a base view