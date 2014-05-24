window.CPBootstrap = ->

  CP.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"
    modalRegion: CP.ModalRegionStruct

  CP.on "initialize:after", ->
    Backbone.history.start {pushState: true}
    CP.headerRegion.show new CP.Views.Header.Layout
    CP.mainRegion.show new CP.Views.AppLayout

  CP.start()