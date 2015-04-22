class app.models.Compass
  ATTRS = ["latitude", "longitude", "altitude", "accuracy",
           "altitudeAccuracy", "heading", "speed"]
  constructor: ->
    @[attr]   = m.prop(0) for attr in ATTRS
    @distance = m.prop(999)
    @bearing  = m.prop(0)
    @_grabGPS()
  _grabGPS: ->
    navigator.geolocation.watchPosition(@_parseGPS, @_parseErr, timeout: 10000)
  _parseGPS: (position) =>
    @[attr](position.coords[attr]) for attr in ATTRS
    @distance @calcDistance()
    @bearing @calcBearing()
    m.redraw()
  radians: (degrees) -> degrees * (Math.PI / 180)
  degrees: (radians) -> radians * (180 / Math.PI)
  calcDistance: ->
    lat1 = @latitude()
    lon1 = @longitude()
    lat2 = 41.7978138
    lon2 = -88.125453
    R = 6371000
    φ1 = @radians lat1
    φ2 = @radians lat2
    Δφ = @radians (lat2 - lat1)
    Δλ = @radians (lon2 - lon1)
    # Such math
    a = Math.sin(Δφ / 2) * Math.sin(Δφ / 2) + Math.cos(φ1) * Math.cos(φ2) * Math.sin(Δλ / 2) * Math.sin(Δλ / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    dist = R * c
    return Math.round dist
  calcBearing: ->
    @lat = @radians @latitude()
    @lon = @radians @longitude()
    to =
      lon: @radians 41.7978138
      lat: @radians -88.125453
    distance = @distance()
    return 0 if distance < 1
    deltaLon = @radians to.lon - @lon
    lat1 = @radians @lat
    lat2 = @radians to.lat
    y = Math.sin(deltaLon) * Math.cos(lat2)
    x = Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(deltaLon)
    res = @degrees Math.atan2 y, x
    bearing = Math.round (res + 360) % 360
    console.log bearing
    bearing
  _parseErr: (err) ->
    messages =
      1: 'Permission denied by user'
      2: 'Cant fix GPS position'
      3: 'GPS is taking too long to respond'
    alert(err.message or messages[err.code] or 'Well, this is embarassing...')
  stop: ->
    navigator.geolocation.clearWatch _grabGPS
