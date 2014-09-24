CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->

  class @Invite extends Backbone.Marionette.ItemView
    template: CPT["user/results/overall/invite"]
    url: ['/api', 'invites'].join('/')
    events:
      "click .js-invite" : "invitePartner"
      "click .js-cancel" : "closeModal"

    initialize: (@options = options = {}) ->
      @type = options.type

    templateHelpers: ->
      {@type}

    invitePartner: (e) ->
      @clearErrors()
      e.preventDefault()
      data = $(@el).formParams()

      $.ajax
        url: @url
        type: 'POST'
        data: data
        success: =>
          CP.vent.trigger 'show:next', {partnerInvited: true}
          CP.modalRegion.show new CP.Views.Globals.Modals.Success type: @type
        error: (jqXHR) => @handleError(jqXHR.responseJSON.errors)

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()

    handleError: (error) ->
      @$el.find('.js-error-messages').append """
        <div class="error-message">#{error} #{@contactMethod()} for your partner </span>
      """
      @$el.find('.js-error-msg-container').show()

    clearErrors: ->
      @$el.find('.js-error-messages').html ""
      @$el.find('.js-error-msg-container').hide()

    contactMethod: ->
      switch @type
        when 'text' then 'number'
        when 'email' then 'email'
