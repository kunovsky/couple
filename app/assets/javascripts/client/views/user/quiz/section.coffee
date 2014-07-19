CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Section extends Marionette.CompositeView
    itemView: Quiz.Question
    template: CPT["common/questionnaire"]
    itemViewContainer: '.js-question-list'

    initialize: (@options = options = {}) ->
      @collection = new CP.Models.Questionnaire id: @options.id

    onRender: ->
      @collection.fetch()

