CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @ResourcesLayout extends Marionette.Layout
    template: CPT["user/results/resources/layout"]
    regions:
      appRegion: '#app-region'
      productsRegion: '#products-region'

    onRender: ->
      @appRegion.show new CP.Views.Common.User.Resources.App
      @productsRegion.show new CP.Views.Common.User.Resources.Products