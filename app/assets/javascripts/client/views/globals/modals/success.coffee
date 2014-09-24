CP.module "Views.Globals.Modals", (Modals, CP, Backbone, Marionette, $, _) ->
  
  class @Success extends Modals.InviteBase
    className: 'success-modal'

    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'notification'].join('/')