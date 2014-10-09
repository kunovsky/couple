CP.module "Views.User.Results.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @App extends Backbone.Marionette.ItemView
    template: CPT['user/results/resources/app']
    events:
      'click .js-image'      : 'showProduct'

    initialize: ->
      @model = CP.MobileApp
      @primaryImage = @model.get('data').primary_image_url

    onRender: ->
      $(@el).find('.js-image').css('background-image', "url(/assets/#{@primaryImage})")

    showProduct: ->
      CP.modalRegion.show new Resources.ProductModal model: @model