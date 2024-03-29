CP.module "Views.Globals.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @InviteBase extends Backbone.Marionette.ItemView

    initialize: (@options = options = {}) ->
      _.extend @, CP.Helpers.Validations::
      @type = options.type

    templateHelpers: ->
      {@type}

    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'notification'].join('/')

    onRender: ->
      $(@el).find('input').inputmask({"mask": "(999) 999-9999"}) if @type == 'text'

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()

    handleError: ->
      @$el.find('.js-error-messages').append """
        <div class="error-message">Please enter a valid #{@contactMethod()} </span>
      """
      @$el.find('.js-error-msg-container').show()

    clearErrors: ->
      @$el.find('.js-error-messages').html ""
      @$el.find('.js-error-msg-container').hide()

    contactMethod: ->
      switch @type
        when 'text' then 'number'
        when 'email' then 'email'