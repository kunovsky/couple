CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model

    initialize: (@options = options = {}) ->
      options = {sId: @options.survey_id, qId: @options.id}
      @possibleResponses = new CP.Models.PossibleResponses
      @possibleResponses.options = options

    fetchPossibleResponses: (options = {}) ->
      @possibleResponses.fetch
        success: options.success
        error: options.error

    createActualResponse: (data) ->
      @model = @model ? new CP.Models.ActualResponse
      @model.save(data)

  class @Questionnaire extends Backbone.Collection
    # model: Models.Question
    
    initialize: (@options = options = {}) ->
      @url = ['api', 'surveys', @options.id].join('/')
