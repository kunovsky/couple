CP.module "Controllers", (Controllers, CP, Backbone, Marionette, $, _) ->
  @addInitializer ->
    CP.ActiveRouters.User = new @UserRoutes

  class @AppController
    index: -> CP.wrapRegion.show new CP.Views.User.Layout page: 'index'
    grouping: (id) -> CP.wrapRegion.show new CP.Views.User.Layout page: 'grouping', id: id ? "1"
    results: (page = 'sections' ) -> CP.wrapRegion.show new CP.Views.User.Layout page: ['results', page]
    resources: (id) -> CP.wrapRegion.show new CP.Views.User.Layout page: ['resources', id]
    purchase: (id) -> CP.wrapRegion.show new CP.Views.User.Layout page: ['purchase', id]
    
  class @UserRoutes extends Controllers.BaseRouter
    controller: new Controllers.AppController

    #TODO: Change all of these routes to be prefixed with /user, need to change the rails routes as well.
    appRoutes:
      ''                            : 'index'
      'user/grouping'               : 'grouping'
      'user/grouping/:id'           : 'grouping'
      'user/results'                : 'results'
      'user/results/:page'          : 'results'
      'user/resources/:id'          : 'resources'
      'user/resources/:id/purchase' : 'purchase'