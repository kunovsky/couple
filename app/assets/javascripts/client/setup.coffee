Backbone.Marionette.Renderer.render = (template, data) -> 
  return throw new Error("Cannot find template") unless template?
  return template(data)

#Init our brand new Marionette App.
window.CP = new Backbone.Marionette.Application()

window.CP.Settings = {}
