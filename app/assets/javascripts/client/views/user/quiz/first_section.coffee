CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @FirstSection extends Marionette.CompositeView
    template: CPT["user/quiz/overall_happiness"]
    itemView: Quiz.Question
    itemViewContainer: '.js-question-container'

    initialize: ->
      @collection = new CP.Models.Survey 

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()