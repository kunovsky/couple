CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @PurchaseSuccess extends Backbone.Marionette.ItemView
    template: CPT['common/resources/purchase_success']
    className: 'purchase__success__container'

    initialize: (@options = options = {}) ->
      @orderNumber = @options.orderNumber

    templateHelpers: ->
      {@orderNumber}