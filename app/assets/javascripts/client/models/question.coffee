CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model
    urlRoot: ->
      "api/questions"

  class @Questions extends Backbone.Collection
    model: Models.Question
    url: ->
      "api/questions"