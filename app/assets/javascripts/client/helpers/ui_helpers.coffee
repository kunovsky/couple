CP.module "Mixins.UI", (UI, CP, Backbone, Marionette, $, _) ->

  @Spinner = {
    Settings: {lines: 13, length: 12, width: 6, radius: 17, color: '#b8c4cf', top: 0, left: 0, zIndex: 99, hwaccel: true}
  }