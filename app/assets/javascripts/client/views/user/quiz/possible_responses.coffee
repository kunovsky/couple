CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @PossibleResponses extends Marionette.CollectionView
    template: ->
    itemView: Quiz.PossibleResponse

    initialize: (@options = options = {})->
      @collection = @model.possibleResponses
      @collection.fetch()