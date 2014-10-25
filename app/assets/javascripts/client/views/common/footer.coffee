CP.module "Views.Common", (Common, CP, Backbone, Marionette, $, _) ->
  class @Footer extends Backbone.Marionette.ItemView
    template: CPT['partials/footer']
    tagName: 'footer'
    className: 'global-footer'

    events: 
      'click .js-link' : 'displayInfoModal'

    displayInfoModal: (e) ->
      e.preventDefault()
      title = $(e.target).data('name') || "Social Media"
      message = "Coming Soon"
      CP.modalRegion.show new CP.Views.Globals.Modals.InfoModal title: title, message: message

