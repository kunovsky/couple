CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @ResourcesLayout extends Marionette.Layout
    template: CPT["user/results/resources/layout"]
    regions:
      appRegion: '#app-region'
      productsRegion: '#products-region'

    initialize: (@options = options = {}) ->
      @productId = @options.productId

    onRender: ->
      @appRegion.show new Results.Resources.App
      @productsRegion.show new Results.Resources.Products
      @scroll() if @productId

    scroll: ->
      #http://stackoverflow.com/questions/6682451/animate-scroll-to-id-on-page-load
      # productId = "#product-#{@productId}"
      # position = $(@el).find(productId).offset().top
      $(@el).scrollTop (1000)