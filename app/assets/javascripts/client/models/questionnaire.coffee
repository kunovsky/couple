CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model
    createActualResponse: (data) ->
      @model = @model ? new CP.Models.ActualResponse
      @model.save(data)

  class @Questionnaire extends Backbone.Collection
    model: Models.Question
    initialize: (@options = options = {}) ->
      @url = ['api', 'questionnaires', @options.id].join('/')
