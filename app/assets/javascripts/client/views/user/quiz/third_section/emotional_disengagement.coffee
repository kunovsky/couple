CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @EmotionalDisengagement extends Marionette.CompositeView
    template: CPT["user/quiz/third_section/emotional_disengagement"]
    itemView: Quiz.Question
    itemViewContainer: '.js-question-container'

    initialize: ->
      options = {sId: 5}
      @collection = new CP.Models.Survey options

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()