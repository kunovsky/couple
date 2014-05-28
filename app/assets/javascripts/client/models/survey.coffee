CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model

    initialize: (question) ->
      options = {sId: question?.survey_id, qId: question?.id}
      @possibleResponses = new CP.Models.PossibleResponses
      @possibleResponses.options = options

    fetchPossibleResponses: (options = {}) ->
      @possibleResponses.fetch
        success: options.success
        error: options.error

    createActualResponse: (data) ->
      @model = @model ? new CP.Models.ActualResponse
      @model.save(data)

  class @Survey extends Backbone.Collection
    model: Models.Question
    
    initialize: (options) ->
      @url = "/api/surveys/#{options.sId}"
