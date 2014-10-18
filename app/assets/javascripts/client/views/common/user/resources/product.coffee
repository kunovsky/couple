CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Product extends Backbone.Marionette.ItemView
    template: CPT['common/resources/product']
    className: 'site-wrap'
    events:
      'click a'         : 'showProduct'
      'click .js-image' : 'showProduct'

    initialize: (@options = options = {})->
      @primaryImage = 'placeholder.jpg'
      @secondaryImage = 'placeholder1.jpg'

    onRender: ->
      # $(@el).find('.js-product-image').css('background-image', "url(/assets/#{@primaryImage})")
      # $(@el).find('.js-product-container').attr('id', "product-#{@model.get('id')}")

    templateHelpers: ->
      action = @model.get('data')['action'] + " " + @model.get('name')
      video = @checkForVideoId()
      {action, video}

    checkForVideoId: -> (@model.get('id') == CP.Settings.personalizedTherapyHelpId)

    showProduct: (e) ->
      e.preventDefault()
      CP.modalRegion.show new Resources.ProductModal model: @model