document.addEventListener 'DOMContentLoaded', (event) ->
  m.route document.body, "/",
      "/":      {controller: app.NavController,   view: app.views.navigation},
      "/about": {controller: app.AboutController, view: app.views.about},
