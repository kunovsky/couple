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
#       #Render page
      @fireRouter(@options.page)

    #Handle Routing
    fireRouter: (page) ->
      @["show#{_.str.capitalize(page)}"]()

    showIndex: ->
      @bodyRegion.show new User.Welcome.Layout
