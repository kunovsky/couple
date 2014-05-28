Backbone.Marionette.Renderer.render = (template, data) -> 
  return throw new Error("Cannot find template") unless template?
  return template(data)

$(document).ajaxSend (e, xhr, options) ->
  token = $("meta[name='csrf-token']").attr("content")
  xhr.setRequestHeader "X-CSRF-Token", token

window.CP = new Backbone.Marionette.Application()

window.CP.ActiveRouters = {}

window.CP.Settings = {}
