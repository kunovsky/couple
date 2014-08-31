CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  
  class @User extends Backbone.Model
    urlRoot: '/api/users'