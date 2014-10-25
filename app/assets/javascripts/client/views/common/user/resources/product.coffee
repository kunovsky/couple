CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Product extends Backbone.Marionette.ItemView
    template: CPT['common/resources/product']
    className: 'site-wrap'
    events:
      'click a'                        : 'showPurchaseInstructions'
      'click .js-secondary-image'      : 'showPurchaseInstructions'
      'mouseenter .js-secondary-image' : 'swapImages'
      'mouseleave .js-secondary-image' : 'revertImages'

    initialize: (@options = options = {})->
      @primaryImage = @model.get('data')['primary_image_url']
      @secondaryImage = @model.get('data')['secondary_image_url']
      @thridImage = @model.get('data')['third_image_url']

    onRender: ->
      @addImage(@primaryImage,'.js-main-image').fadeIn(1500) if @primaryImage
      @addImage(@secondaryImage).fadeIn(1500) 

    templateHelpers: ->
      action = @model.get('data')['action'] + " " + @model.get('name')
      video = @checkForVideoId()
      {action, video}

    addImage: (image, selector = '.js-secondary-image') ->
      $(@el).find(selector).css('background-image', "url(/assets/#{image})")

    swapImages: -> @addImage(@thridImage)

    revertImages: -> @addImage(@secondaryImage)

    checkForVideoId: -> (@model.get('id') == CP.Settings.couplesWorkshopId)

    showPurchaseInstructions: (e) ->
      e.preventDefault()
      return CP.modalRegion.show new Resources.ProductModal model: @model if @model.get('data')['remote_access']
      CP.ActiveRouters.User.navigate ["/resources", @model.get('id'), "purchase"].join("/"), true