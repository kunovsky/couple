CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Section extends Marionette.ItemView
    template: CPT["common/questionnaire"]

    events: 
      'click .js-response-button' : 'setActualResponse'

    initialize: (@options = options = {}) ->
      @url = ['api', 'questionnaires', @options.id].join('/')
      @saveUrl = ['users', '1', 'actual_responses'].join('/')
      @fetchCollection()
      @questions = []

    templateHelpers: ->
      return {questions: @questions}

    setActualResponse: (e) ->    
      data = {response_id: $(e.target).data('rid'), question_id: $(e.target).data('qid'), questionnaire_id: @questionnaire_id}
      @saveActualResponse(data)

    fetchCollection: (range) ->
      $.ajax
        type: 'GET'
        url: @url
        success: (response) =>
          @questionnaire_id = response[0]['questionnaire_id']
          @questions = response
          @render()

    saveActualResponse: (data) ->
      $.ajax
        type: 'POST'
        url: @saveUrl
        data: data     