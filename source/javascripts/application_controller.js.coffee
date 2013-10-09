class window.ApplicationController
  constructor: ->
    window.WORLD_SIZE = 1000
    @init = new ThreeInit({renderer: {antialias: true}})
    window.init = @init
    @controllers = []

    @controllers.push(new ButterflyController(@init))
    @controllers.push(new FlowersController(@init))
    @controllers.push(new MeadowController(@init))

  render: =>
    for controller in @controllers
      controller.render()

    pos = @controllers[0].butterfly.position
    @init.camera.lookAt({x: pos.x, y: pos.y, z: pos.z})

    @init.render()

  run: =>
    @render()
    requestAnimationFrame(@run)
