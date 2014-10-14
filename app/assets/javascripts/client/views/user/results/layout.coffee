CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/results/layout"]
    className: 'results-layout'

    regions:
      subMenuRegion: '#sub-menu-region'
      layoutRegion: '#layout-region'

    initialize: (@options = options = {}) ->
      @listenTo CP.vent, 'show:resource', @showResource

    onRender: ->
      @setMenu()
      @setPage()

    setMenu: ->
      @subMenuRegion.show new Results.SubMenu active: @options.page

    setPage: ->
      @layoutRegion.show new Results["#{_.str.capitalize(@options.page)}Layout"]

    showResource: (id) ->
      CP.ActiveRouters.User.navigate '/results/resources'
      @layoutRegion.show new Results.ResourcesLayout productId: id