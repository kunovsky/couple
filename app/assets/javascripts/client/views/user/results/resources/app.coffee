CP.module "Views.User.Results.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @App extends Backbone.Marionette.ItemView
    template: CPT['user/results/resources/app']
    events:
      'click .js-image'      : 'showProduct'
      'click a'       : 'showProduct'

    initialize: ->
      @model = CP.MobileApp
      @primaryImage = @model.get('data').primary_image_url

    onRender: ->
      $(@el).find('.js-image').css('background-image', "url(/assets/#{@primaryImage})")
      $(@el).find('.js-app-container').attr('id', "product-#{@model.get('id')}")

    showProduct: (e) ->
      e.preventDefault()
      CP.modalRegion.show new Resources.ProductModal model: @model