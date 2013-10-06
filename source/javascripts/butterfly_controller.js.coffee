class window.ButterflyController
  constructor: ->
    @init = new ThreeInit
    @group = new THREE.Object3D()
    @loader = new THREE.JSONLoader()
    @createButterfly()
    @init.scene.add(@group)

  createButterfly: =>
    @loader.load 'models/butterfly.js', (geometries, materials) =>
      butterfly = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      # @butterfly.position.set 50, 30, 0
      # @butterfly.scale.set 0.3, 0.3, 0.3
      # @butterfly.overdraw = true
      # @butterfly.castShadow = true
      # @butterfly.receiveShadow = true
      @group.add(butterfly)

  render: =>
    @group.rotation.x += 0.02
    @group.rotation.y += 0.0225
    @group.rotation.z += 0.0175

    # dtime = Date.now() - @start
    # @cube.scale.x  = 1.0 + 0.3*Math.sin(dtime/300)
    # @cube.scale.y  = 1.0 + 0.3*Math.sin(dtime/300)
    # @cube.scale.z  = 1.0 + 0.3*Math.sin(dtime/300)

    @init.render()

  run: =>
    @render()
    requestAnimationFrame(@run)
