CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->
  
  class @NotifySelf extends CP.Views.Globals.Modals.InviteBase
    template: CPT["user/results/overall/notify_self"]
    className: 'success-modal'
    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'notification'].join('/')