CP.ActiveRouters = {}
CP.addRegions
  wrapRegion: '#js-attach-wrap'
  footerRegion: '#js-attach-footer'
  modalRegion: CP.ModalRegionStruct

window.CPBootstrap = ->
  
  $(document).ajaxSend (e, xhr, options) ->
    token = $("meta[name='csrf-token']").attr("content")
    xhr.setRequestHeader "X-CSRF-Token", token

  CP.on "initialize:after", ->
    Backbone.history.start {pushState: true}

  CP.start()