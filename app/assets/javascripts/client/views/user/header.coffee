CP.module "Views.User", (User, CP, Backbone, Marionette, $, _) ->
  class @Header extends Backbone.Marionette.ItemView
    template: CPT['user/header']
    events:
      'click .js-research' : 'showResearchModal'
      'click .js-site-title': 'home'

    showResearchModal: -> CP.modalRegion.show new CP.Views.User.Welcome.MoreInfo.Modals.Research

    #TODO: Prompt them to make sure they want to leave the page ther are on if the page is not the homepage
    home: -> window.location.href = '/'