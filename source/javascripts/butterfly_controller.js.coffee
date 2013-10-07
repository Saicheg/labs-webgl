class window.ButterflyController extends BaseController
  constructor: (init) ->
    @init = init
    @butterfly = new THREE.Object3D()
    @init.scene.add(@butterfly)
    @loader = new THREE.JSONLoader()
    @createButterfly()

  createButterfly: =>
    @loader.load 'models/wing-left.js', (geometries, materials) =>
      wing = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      wing.position.set 0, 0, -100
      wing.rotation.x = 2
      wing.scale.set 0.01, 0.01, 0.01
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(wing)
    @loader.load 'models/wing-right.js', (geometries, materials) =>
      wing = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      wing.position.set 0, 0, -100
      wing.rotation.x = 2
      # wing.rotation.y = 2
      # wing.rotation.z = 2
      wing.scale.set 0.01, 0.01, 0.01
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(wing)
    @loader.load 'models/body.js', (geometries, materials) =>
      body = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      body.position.set 0, 0, -100
      body.scale.set 0.01, 0.01, 0.01
      body.rotation.x = 2
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(body)
