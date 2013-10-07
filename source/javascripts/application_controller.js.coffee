class window.ApplicationController
  constructor: ->
    @init = new ThreeInit
    @controllers = []

    @butterfly_controller = new ButterflyController(@init)
    @meadow_controller = new MeadowController(@init)

    @controllers.push(@butterfly_controller)
    @controllers.push(@meadow_controller)

    @init.scene.add(@group)

  render: =>
    for controller in @controllers
      controller.render()

    @init.render()

  run: =>
    @render()
    requestAnimationFrame(@run)
