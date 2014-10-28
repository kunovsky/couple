CP.module "Views.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/resources/layout"]
    className: 'resource-layout'

    regions:
      subMenuRegion: '#sub-menu-region'
      resourceRegion: '#resource-region'

    initialize: (@options = options = {}) ->
      @productId = parseInt(@options.productId)
      @purchase = @options.purchase

      @listenTo CP.vent, 'purchase:complete', @showPurchaseSuccess

    onRender: -> @setMenu(); @setPage(); @scrollTop

    #TODO: Need a link that is back to home page if you have not completed the questionnaire yet
    setMenu: -> @subMenuRegion.show new Resources.BreadCrumb 

    setPage: ->
      return @showPurchasePage(product) if @purchase && product = _.find CP.Products.models, (p) => p.id is @productId
      return @showApp() if _.find CP.MobileApp, (app) => app.id is @productId
      return @showProduct(product) if product = _.find CP.Products.models, (p) => p.id is @productId
      @showTherapy(therapy) if therapy = _.find CP.Products.models, (p) => p.id is CP.Settings.personalizedTherapyHelpId

    showPurchasePage: (product) ->
      @resourceRegion.show new CP.Views.Common.User.Resources.Purchase model: product

    showApp: ->
      @resourceRegion.show new CP.Views.Common.User.Resources.App

    showProduct: (product) ->
      @resourceRegion.show new CP.Views.Common.User.Resources.Product model: product

    showTherapy: (therapy) ->
      @resourceRegion.show new CP.Views.Common.User.Resources.Product model: therapy

    showPurchaseSuccess: (orderData) ->
      @resourceRegion.show new CP.Views.Common.User.Resources.PurchaseSuccess orderData