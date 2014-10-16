CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Products extends Backbone.Marionette.CompositeView
    template: CPT['common/resources/products']
    itemView: Resources.Product
    itemViewContainer: '.js-products-container'

    initialize: ->
      @collection = CP.Products