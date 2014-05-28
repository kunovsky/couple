CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  
  class @ActualResponse extends Backbone.Model
    url: -> "/actual_responses"