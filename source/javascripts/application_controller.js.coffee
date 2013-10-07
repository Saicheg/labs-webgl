class window.ApplicationController
  constructor: ->
    @init = new ThreeInit
    window.init = @init
    @controllers = []

    @controllers.push(new ButterflyController(@init))
    @controllers.push(new MeadowController(@init))

  render: =>
    for controller in @controllers
      controller.render()

    @init.render()

  run: =>
    @render()
    requestAnimationFrame(@run)
