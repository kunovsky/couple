CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  
  class @Survey extends Backbone.Collection
    model: Models.Question
    
    initialize: (path) ->
      @url = "api/surveys/#{path.surveyNumber}"
