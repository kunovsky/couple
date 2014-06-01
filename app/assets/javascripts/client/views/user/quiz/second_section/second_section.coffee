CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @SecondSection extends Marionette.CompositeView
    template: CPT["user/quiz/second_section/love_maps"]
    itemView: Quiz.Question
    itemViewContainer: '.js-question-container'

    initialize: ->
      options = {sId: 2}
      @collection = new CP.Models.Survey options

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()