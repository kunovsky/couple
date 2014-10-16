CP.module "Views.User", (User, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/layout"]

    regions:
      headerRegion: '#headerRegion'
      bodyRegion:   '#bodyRegion'

    initialize: (@options = options = {}) ->
      @options.page = @options.page ? "index"

    onRender: ->
      #Setup the footer
      CP.footerRegion.show new CP.Views.Common.Footer
      #Setup the header
      @headerRegion.show new CP.Views.User.Header
      #Render page
      @fireRouter(@options.page)

    #Handle Routing
    fireRouter: (page) ->
      if _.isArray page
        root_page = page[0]
        @["show#{_.str.capitalize(root_page)}"](_.rest(page))
      else
        root_page = page
        @["show#{_.str.capitalize(page)}"]()

    showIndex: ->
      @bodyRegion.show new User.Welcome.Layout

    showGrouping: ->
      @bodyRegion.show new User.Section.Grouping id: @options.id

    showResults: (subPage) ->
      @bodyRegion.show new User.Results.Layout page: subPage[0]

    showResources: (productId) ->
      @bodyRegion.show new User.Resources.Layout productId: productId[0]
