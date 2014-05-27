CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model
    initialize: (question) ->
      options = {sId: question?.survey_id, qId: question?.id}
      @possibleResponses = new CP.Models.PossibleResponses
      @possibleResponses.options =  options

    fetchResponses: (options = {}) ->
      @possibleResponses.fetch
        success: options.success
        error: options.error


  class @Survey extends Backbone.Collection
    model: Models.Question
    
    initialize: ->
      @url = "api/surveys/1"
