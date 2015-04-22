app.views.navigation = (c) ->

  compass = ->
    m 'div', [
      m("img[src='img/arrow.png']",
        style:
          transform: "rotate(#{c.loc.bearing() || '0'}deg)")
    ]

  status = ->
    m 'div', [
      m 'p', "Your position: #{c.loc.latitude()}, #{c.loc.longitude()}"
      m 'p', "Distance (M): #{c.loc.distance()}"
    ]

  [
    compass(),
    status()
  ]

app.views.about = (c) ->
  [
    m 'div', c.description()
  ]
