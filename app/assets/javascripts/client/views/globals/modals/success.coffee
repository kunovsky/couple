CP.module "Views.Globals.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Success extends Backbone.Marionette.ItemView
    template: CPT['globals/modals/success']
    className: 'success-modal'
    events: 
      "click .js-invite" : "invitePartner"
      "click .js-cancel" : "closeModal"

    initialize: (@options = options = {}) ->
      @type = options.type

    templateHelpers: ->
      {@type}
      
    invitePartner: (e) ->
      e.preventDefault()
      data = $(@el).formParams()
      $.ajax
        url: ['/api', 'users', CP.CurrentUser.get('id'), 'notification'].join('/')
        type: 'POST'
        data: data
        success: => CP.modalRegion.show new Modals.Finished
        error: (respObj) -> console.log respObj

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()

#ToDo: Refactor this and the invite coffe to have a base modal