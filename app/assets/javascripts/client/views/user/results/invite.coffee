CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Invite extends Backbone.Marionette.ItemView
    template: CPT["user/results/invite"]
    events: 
      "click .js-invite" : "invitePartner"
      "click .js-cancel" : "closeModal"

    initialize: (@options = options = {}) ->
      [@type, @] = options.type

    templateHelpers: ->
      {@type}
      
    invitePartner: (e) ->
      e.preventDefault()
      data = $(@el).formParams()
      $.ajax
        url: ['/api', 'invite'].join('/')
        type: 'POST'
        data: data
        success: => CP.modalRegion.show new CP.Views.Globals.Modals.Success type: @type
        error: (respObj) -> console.log respObj

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()