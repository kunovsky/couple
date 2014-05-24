CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Part1 extends Marionette.CompositeView
    template: CPT["user/quiz/part1"]
    itemView: Quiz.Question
    itemViewContainer: '.js-question-container'

    initialize: ->
      @collection = new CP.Models.Questions

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()