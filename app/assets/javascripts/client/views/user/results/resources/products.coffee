CP.module "Views.User.Results.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Products extends Backbone.Marionette.CompositeView
    template: CPT['user/results/resources/products']