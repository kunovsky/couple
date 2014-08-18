CP.module "Controllers", (Controllers, CP, Backbone, Marionette, $, _) ->
  @addInitializer ->
    CP.ActiveRouters.User = new @UserRoutes

  class @AppController
    showHome: -> CP.wrapRegion.show new CP.Views.User.Layout page: 'index'
    questionnaire: (id) -> CP.wrapRegion.show new CP.Views.User.Layout page: 'questionnaire', id: id ? "1"
    results: -> CP.wrapRegion.show new CP.Views.User.Layout page: 'results'
    
  class @UserRoutes extends Controllers.BaseRouter
    controller: new Controllers.AppController

    appRoutes:
      ''                   : 'showHome'
      'questionnaire'      : 'questionnaire'
      'questionnaire/:id'  : 'questionnaire'
      'results'            : 'results'

