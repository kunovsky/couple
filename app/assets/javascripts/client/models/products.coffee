CP.module "Models", (Models, CP, Backbone, Marionette, $, _) ->
  class @Product extends Backbone.Model
    initialize: (@options = options = {}) ->

  class @Products extends Backbone.Collection
    model: Models.Product
    urlRoot: -> "/api/products"