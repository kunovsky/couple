CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  
  class @ActualResponse extends Backbone.Model
    urlRoot: -> "/users/1/actual_responses"