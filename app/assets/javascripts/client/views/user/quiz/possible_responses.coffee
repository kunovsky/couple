CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @PossibleResponses extends Marionette.CollectionView
    itemView: Quiz.PossibleResponse

    initialize: (@options = options = {})->
      @collection = new CP.Models.PossibleResponses options

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()