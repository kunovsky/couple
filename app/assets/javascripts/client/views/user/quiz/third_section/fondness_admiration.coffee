CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @FondnessAdmiration extends Marionette.CompositeView
    template: CPT["user/quiz/third_section/fondness_admiration"]
    itemView: Quiz.Question
    itemViewContainer: '.js-question-container'

    initialize: ->
      options = {sId: 4}
      @collection = new CP.Models.Survey options

    onRender: ->
      @fetchCollection()

    fetchCollection: ->
      @collection.fetch()