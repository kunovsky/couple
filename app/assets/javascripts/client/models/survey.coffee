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
      @model ? @model : @model = CP.Models.ActualResponse
     # $.ajax
     #   type: 'POST'
     #   url: "/actual_responses"
     #   data: data
     #   success: -> console.log arguments
     #   error: -> console.log arguments

  class @Survey extends Backbone.Collection
    model: Models.Question
    
    initialize: ->
      @url = "/api/surveys/1"
