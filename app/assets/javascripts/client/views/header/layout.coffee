CP.module "Views.Header", (Header, App, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.ItemView
    template: CPT["header/header"]