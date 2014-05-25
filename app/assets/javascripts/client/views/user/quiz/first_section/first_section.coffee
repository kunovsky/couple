CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @FirstSection extends Marionette.CompositeView
    template: CPT["user/quiz/overall_happiness"]
    itemView: Quiz.Question
    itemViewContainer: '.js-question-container'

    initialize: ->
      options = {surveyNumber: 1}
      @collection = new CP.Models.Survey options

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()
       