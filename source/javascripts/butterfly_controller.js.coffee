class window.ButterflyController
  constructor: ->
    @start = Date.now()

    @init = new ThreeInit
    @init.createScene()
    @init.createCamera()
    @init.createRenderer()

    @createCube()

  createCube: =>
    geometry = new THREE.CubeGeometry(200,200,200)
    material = new THREE.MeshNormalMaterial()

    @cube = new THREE.Mesh(geometry, material)
    @cube.position.y = 150

    @init.scene.add(@cube)

  render: =>
    @cube.rotation.x += 0.02
    @cube.rotation.y += 0.0225
    @cube.rotation.z += 0.0175

    dtime = Date.now() - @start
    @cube.scale.x  = 1.0 + 0.3*Math.sin(dtime/300)
    @cube.scale.y  = 1.0 + 0.3*Math.sin(dtime/300)
    @cube.scale.z  = 1.0 + 0.3*Math.sin(dtime/300)

    @init.render()

  run: =>
    @render()
    requestAnimationFrame(@run)
