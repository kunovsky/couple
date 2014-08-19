CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Section extends Marionette.ItemView
    template: CPT["common/questionnaire"]

    events: 
      'click .js-response-button'           : 'setActualResponse'
      'click .js-next-questionnaire-button' : 'createCompletedQuestionnaire'

    initialize: (@options = options = {}) ->
      @url = ['../', 'api', 'questionnaires', @options.id].join('/')
  
      @fetchCollection()
      @questions = []
      @lastQuestionnaireNumber = 5

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
          @questions = response
          @render()

    saveUrl: ->
      ['../','users', '1', 'actual_responses'].join('/')

    saveActualResponse: (data) ->
      $.ajax
        type: 'POST'
        url: @saveUrl()
        data: data
        success: (response) =>
          @enableNextSection() if response

    enableNextSection: ->
      $(@el).find('.next-questionnaire-button').attr('disabled', false)

    nextQuestionnaireNumber: ->
      Number(@options.id)+1

    handleButtonState: (target) ->
      target.attr("disabled","disabled").siblings().attr("disabled", false)

    handleRequestData: (target) ->
      {response_id: target.data('rid'), question_id: target.data('qid'), questionnaire_id: @options.id}

    createCompletedQuestionnaire: ->
      $.ajax
        type: 'POST'
        url: @completedSurveyUrl()
        data: {questionnaire_id: @options.id}
        success: =>
          @handleNextSection()

    handleNextSection: ->
      if (@nextQuestionnaireNumber() < 6) then return @nextSection() 
      @handleProcessCompletion()

    handleProcessCompletion: ->
      $.ajax
        type: 'POST'
        url: '../api/score'
        success: => @nextSection()

    nextSection: -> CP.ActiveRouters.User.navigate @nextSectionUrl(), true

    nextSectionUrl: ->
      return 'results' if @nextQuestionnaireNumber() > @lastQuestionnaireNumber
      ['questionnaire', @nextQuestionnaireNumber()].join('/')

    completedSurveyUrl: ->
      ['../', 'users', '1', 'completed_questionnaires'].join('/')
