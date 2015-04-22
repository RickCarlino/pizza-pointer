# Main controller that shows navigation info
class app.NavController
  constructor: ->
    # set this.loc to a new instance of our compass model. Used by view.
    @loc = new app.models.Compass

class app.AboutController
  constructor:  ->
    @description = m.prop "This is just an example of using a router. " +
    "There was no need to use a view / controller, but I did so as an example"
