Backbone.Marionette.Renderer.render = (template, data) -> 
  return throw new Error("Cannot find template") unless template?
  return template(data)

window.CP = new Backbone.Marionette.Application()

window.CP.Settings = {lastQuestionnaireNumber: 5, lastGroupingNumber: 3}
