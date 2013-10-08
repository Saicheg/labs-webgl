class window.ApplicationController
  constructor: ->
    @init = new ThreeInit
    window.init = @init
    @controllers = []

    @controllers.push(new ButterflyController(@init))
    @controllers.push(new MeadowController(@init))

  render: =>
    # timer = - new Date().getTime() * 0.0002
    # @init.camera.position.x = 1000 * Math.cos( timer )
    # @init.camera.position.z = 1000 * Math.sin( timer )
    for controller in @controllers
      controller.render()

    @init.render()

  run: =>
    @render()

    @init.camera.lookAt({x:0, y:0, z:0})

    requestAnimationFrame(@run)
