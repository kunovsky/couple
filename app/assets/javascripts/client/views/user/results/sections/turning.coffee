CP.module "Views.User.Results.Sections", (Sections, CP, Backbone, Marionette, $, _) ->

  class @Turning extends CP.Views.Common.User.ResultsBase
    name: "Turning Towards"
    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', '4'].join('/')