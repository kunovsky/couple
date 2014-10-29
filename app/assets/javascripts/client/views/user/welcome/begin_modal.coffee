CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @BeginModal extends Marionette.ItemView
    template: CPT["user/welcome/begin_modal"]
    events: 
      'click .js-begin-questionnaire' : 'beginQuestionnaire'
      'click .js-modal-close'         : 'closeModal'

    closeModal: -> CP.modalRegion.close()

    beginQuestionnaire: (e) ->
      e.preventDefault()
      $.ajax
        type: 'POST'
        url: '/sessions'
        success: (respObj) => 
          window.location.href = respObj.path

