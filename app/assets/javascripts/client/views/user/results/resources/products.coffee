CP.module "Views.User.Results.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Products extends Backbone.Marionette.CompositeView
    template: CPT['user/results/resources/products']
    itemView: Resources.Product
    itemViewContainer: '.js-products-container'

    initialize: ->
      @collection = CP.Products