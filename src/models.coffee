class app.models.Location
  constructor: (compass) ->
    @distance = m.prop(compass.wow)
    @lat = m.prop(compass.lat)
    @lng = m.prop(compass.lng)
