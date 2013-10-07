class window.ApplicationController
  constructor: ->
    @init = new ThreeInit
    @butterfly_controller = new ButterflyController(@init)
    @meadow_controller = new MeadowController(@init)
    @init.scene.add(@group)

  render: =>
    # @group.rotation.x += 0.02
    # @group.rotation.y += 0.0225
    # @group.rotation.z += 0.0175

    # dtime = Date.now() - @start
    # @cube.scale.x  = 1.0 + 0.3*Math.sin(dtime/300)
    # @cube.scale.y  = 1.0 + 0.3*Math.sin(dtime/300)
    # @cube.scale.z  = 1.0 + 0.3*Math.sin(dtime/300)

    @init.render()

  run: =>
    @render()
    requestAnimationFrame(@run)
