app.views.navigation = (c) ->
  # View for the pointy-arrow UI components.
  compass = ->
    m 'div', [
      m("img[src='img/arrow.png']",
        style:
          transform: "rotate(#{ c.loc.bearing() || '0' }deg)")
    ]

  # View that live-updates the user's position.
  status = ->
    m 'div', [
      m 'p', "Your position: #{c.loc.latitude()}, #{c.loc.longitude()}"
      m 'p', "Distance (M): #{c.loc.distance()}"
    ]

  # Bundle them together in an array and return them as a single view.
  [
    compass(),
    status()
  ]

# This one doesn't do much, but it shows how to work multiple controllers /
# views using the router
app.views.about = (c) ->
  [
    m 'div', c.description()
  ]
