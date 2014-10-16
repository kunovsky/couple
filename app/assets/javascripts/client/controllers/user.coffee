CP.module "Controllers", (Controllers, CP, Backbone, Marionette, $, _) ->
  @addInitializer ->
    CP.ActiveRouters.User = new @UserRoutes

  class @AppController
    showHome: -> CP.wrapRegion.show new CP.Views.User.Layout page: 'index'
    grouping: (id) -> CP.wrapRegion.show new CP.Views.User.Layout page: 'grouping', id: id ? "1"
    results: (page = 'sections' ) -> CP.wrapRegion.show new CP.Views.User.Layout page: ['results', page]
    resources: (id) -> CP.wrapRegion.show new CP.Views.User.Layout page: ['resources', id]
    
  class @UserRoutes extends Controllers.BaseRouter
    controller: new Controllers.AppController

    appRoutes:
      ''                   : 'showHome'
      'grouping'           : 'grouping'
      'grouping/:id'       : 'grouping'
      'results'            : 'results'
      'results/:page'      : 'results'
      'resources/:id'      : 'resources'
