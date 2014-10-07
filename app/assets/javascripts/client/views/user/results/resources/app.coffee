CP.module "Views.User.Results.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @App extends Backbone.Marionette.ItemView
    template: CPT['user/results/resources/app']