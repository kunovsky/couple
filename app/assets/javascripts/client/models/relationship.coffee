CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @User extends Backbone.Model
    url: ->
      "/users"
  
  class @Relationship extends Backbone.Collection
    model: Models.User
    
    url: ->
      "/relationships"
