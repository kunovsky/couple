CP.module "Controllers", (Controllers, CP, Backbone, Marionette, $, _) ->
  @addInitializer ->
    CP.ActiveRouters.User = new @UserRoutes

  class @AppController
    showHome: -> CP.wrapRegion.show new CP.Views.User.Layout page: 'index'
    questionnaire: (path) -> CP.wrapRegion.show new CP.Views.User.Layout page: 'questionnaire'
    
  class @UserRoutes extends Controllers.BaseRouter
    controller: new Controllers.AppController

    appRoutes:
      ''                 : 'showHome'
      'questionnaire'    : 'questionnaire'

