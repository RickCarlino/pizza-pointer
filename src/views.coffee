links = (_c) ->
  m('div',
    [
      m('ul', [
        m('li', [ m("a[href='?/nav']", 'Navigate') ])
        m('li', [ m("a[href='?/about']", 'About') ])
      ])
  ])

app.views.navigation = (c) ->
  twoWayinputBox = (attr) ->
    m 'input[type=text]',
      value: attr(),
      onchange: m.withAttr('value', attr)

  input = ->
    m 'div', [
      twoWayinputBox(c.target.lat)
      twoWayinputBox(c.target.lng)
    ]

  compass = ->
    m 'div', [
      m("img[src='img/arrow.png']",
        style:
          transform: "rotate(#{c.loc.bearing() || '0'}deg)")
    ]

  status = ->
    m 'div', [
      m 'p', "Lat: #{c.loc.latitude()}"
      m 'p', "Lng: #{c.loc.longitude()}"
      m 'p', "Meters: #{c.loc.distance()}"
    ]

  [
    links(),
    input(),
    compass(),
    status()
  ]

app.views.about = (c) ->
  [
    links(c)
    m 'div', c.description()
  ]
