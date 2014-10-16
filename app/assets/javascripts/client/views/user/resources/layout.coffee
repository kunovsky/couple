CP.module "Views.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/resources/layout"]
    className: 'product-layout'

    regions:
      subMenuRegion: '#sub-menu-region'
      resourceRegion: '#resource-region'

    initialize: (@options = options = {}) -> @productId = Number(@options.productId)

    onRender: -> @setMenu(); @setPage(); @scrollTop

    setMenu: -> @subMenuRegion.show new Resources.BreadCrumb

    setPage: ->
      return @showApp() if _.find CP.MobileApp, (app) => app.id is @productId
      return @showProduct(product) if product = _.find CP.Products.models, (p) => p.id is @productId
      @showTherapy(therapy) if therapy = _.find CP.Products.models, (p) => p.id is CP.Settings.personalizedTherapyHelpId

    showApp: ->  return @resourceRegion.show new CP.Views.Common.User.Resources.App

    showProduct: (product) ->  @resourceRegion.show new CP.Views.Common.User.Resources.Product model: product

    showTherapy: (therapy) -> @resourceRegion.show new CP.Views.Common.User.Resources.Product model: therapy 



      