CP.module "Controllers", (Controllers, CP, Backbone, Marionette, $, _) ->
  @addInitializer ->
    CP.ActiveRouters.User = new @UserRoutes

  class @AppController
    showHome: -> CP.wrapRegion.show new CP.Views.User.Layout page: 'index'
    
  class @UserRoutes extends Controllers.BaseRouter
    controller: new Controllers.AppController

    appRoutes:
      ''                 : 'showHome'

