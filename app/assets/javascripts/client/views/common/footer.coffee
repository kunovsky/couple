CP.module "Views.Common", (Common, CP, Backbone, Marionette, $, _) ->
  class @Footer extends Backbone.Marionette.ItemView
    template: CPT['partials/footer']
    tagName: 'footer'
    className: 'global-footer'