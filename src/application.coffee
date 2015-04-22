# Wait for the DOM to finish loading.
document.addEventListener 'DOMContentLoaded', (event) ->
  # Set our app to live inside of <div id="#app">
  # Default route is '/'
  m.route document.getElementById("app"), "/",
      # Set view and controller for default route
      "/":      {controller: app.NavController,   view: app.views.navigation},
      # Now for the /about page, which was only implemented as an example.
      "/about": {controller: app.AboutController, view: app.views.about},
