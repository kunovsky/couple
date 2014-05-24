CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model

  class @Questions extends Backbone.Collection
    model: Models.Question
    url: ->
      "api/questions"