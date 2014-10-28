CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @PurchaseSuccess extends Backbone.Marionette.ItemView
    template: CPT['common/resources/purchase_success/success']
    className: 'purchase__success__container'
    events:
      'click .js-access-button' : 'accessProduct'

    initialize: (@options = options = {}) ->
      @instantAccess = @options.instant_access
      @model = _.find CP.Products.models, (p) => p.id is parseInt(@options.product_id)

    getTemplate: ->
      return CPT['common/resources/purchase_success/instant_access'] if @instantAccess
      return @template

    templateHelpers: ->
      @name = @model.get('name')
      {@name}

    accessProduct: ->
      CP.modalRegion.show new CP.Views.Globals.Modals.InfoModal title: @name, message: "Coming Soon"