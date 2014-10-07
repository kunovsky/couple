CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @ResourcesLayout extends Marionette.Layout
    template: CPT["user/results/resources/layout"]

    regions:
      appRegion: '#app-region'
      productsRegion: '#products-region'

    onRender: ->
      @appRegion.show new Results.Resources.App
      @productsRegion.show new Results.Resources.Products