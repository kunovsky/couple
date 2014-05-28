CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @TurningTowards extends Marionette.CompositeView
    template: CPT["user/quiz/third_section/turning_towards"]
    itemView: Quiz.Question
    itemViewContainer: '.js-question-container'

    initialize: ->
      options = {sId: 3}
      @collection = new CP.Models.Survey options

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()