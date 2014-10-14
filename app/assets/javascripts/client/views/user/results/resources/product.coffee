CP.module "Views.User.Results.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Product extends Backbone.Marionette.ItemView
    template: CPT['user/results/resources/product']
    className: 'product__container'
    events:
      'mouseover'       : 'changeBackGroundImage'
      'mouseleave'      : 'revertBackgroundImage'
      'click a'         : 'showProduct'
      'click .js-image' : 'showProduct'

    initialize: (@options = options = {})->
      @primaryImage = 'placeholder.jpg'
      @secondaryImage = 'placeholder1.jpg'

    onRender: ->
      # $(@el).find('.js-product-image').css('background-image', "url(/assets/#{@primaryImage})")
      $(@el).find('.js-product-container').attr('id', "product-#{@model.get('id')}")

    revertBackgroundImage: ->
      # $(@el).find('.js-product-image').css('background-image', "url(/assets/#{@primaryImage})")

    changeBackGroundImage: ->
      # $(@el).find('.js-product-image').css('background-image', "url(/assets/#{@secondaryImage})")

    showProduct: (e) ->
      e.preventDefault()
      CP.modalRegion.show new Resources.ProductModal model: @model