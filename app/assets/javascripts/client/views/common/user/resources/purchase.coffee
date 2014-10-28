CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Purchase extends Backbone.Marionette.ItemView
    template: CPT['common/resources/purchase']
    className: 'purchase__product__container'
    events:
      'submit #purchase-form' : 'handlePurchase'

    initialize: (@options = options = {}) ->
      @model = @options.model
      @secondaryImage = @model.get('data')['secondary_image_url']

    onRender: ->
      @addImage(@secondaryImage, '.js-product').fadeIn(1500) 

    templateHelpers: ->
      name = @model.get('name')
      title = @model.get('data')['action'] + " " + @model.get('name')
      data = @model.get('data')
      {name, title, data}

    addImage: (image, selector) ->
      $(@el).find(selector).css('background-image', "url(/assets/#{image})")

    purchaseUrl: -> ['/api', 'purchases'].join('/')

    #TODO: Add data validations to everything here
    handlePurchase: (e)  ->
      e.preventDefault()
      data =  $(e.target).formParams()
      # return unless @validParams()
      @tryPurchase(data)

    #TODO: Implement web hooks
    tryPurchase: (data) ->
      $.ajax
        type: "POST"
        url: @purchaseUrl()
        data: name
        success: (orderNumber) =>
          #set bread crumb to go back to product
          CP.vent.trigger 'purchase:complete', orderNumber