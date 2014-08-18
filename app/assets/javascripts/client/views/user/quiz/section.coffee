CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Section extends Marionette.ItemView
    template: CPT["common/questionnaire"]

    events: 
      'click .js-response-button'     : 'setActualResponse'
      'click .js-next-section-button' : 'nextSection'

    initialize: (@options = options = {}) ->
      @url = ['../', 'api', 'questionnaires', @options.id].join('/')
      @saveUrl = ['../','users', '1', 'actual_responses'].join('/')
      @fetchCollection()
      @questions = []

    templateHelpers: ->
      return {questions: @questions}

    setActualResponse: (e) ->
      e.preventDefault()
      @handleButtonState($(e.target))
      data = @handleRequestData($(e.target))
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

    handleButtonState: (target) ->
      target.attr("disabled","disabled").siblings().attr("disabled", false)

    handleRequestData: (target) ->
      {response_id: target.data('rid'), question_id: target.data('qid'), questionnaire_id: @questionnaire_id}

    nextSectionUrl: ->
      return 'results' if Number(@questionnaire_id)+1 == 6
      ['questionnaire', Number(@questionnaire_id)+1].join('/')

    nextSection: ->
      CP.ActiveRouters.User.navigate @nextSectionUrl(), true