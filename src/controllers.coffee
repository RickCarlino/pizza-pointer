class app.NavController
  constructor: ->
    # Default to pizza place by Rev3
    @target =
      lat: m.prop(41.7978138)
      lng: m.prop(-88.125453)

    @loc = new app.models.Compass
  onunload: => @loc.stop() # Tell the compass to stop polling. Nice.

class app.AboutController
  constructor:  ->
    txt = "This is just an example of using a router. " +
          "There was no need to use a view / controller, but I did"
    @description = m.prop(txt)
