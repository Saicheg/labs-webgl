class window.ButterflyController extends BaseController
  constructor: (init) ->
    @init = init
    @butterfly = new THREE.Object3D()
    @init.scene.add(@butterfly)
    @loader = new THREE.JSONLoader()
    @createButterfly()

  createButterfly: =>
    @loader.load 'models/wing-left.js', (geometries, materials) =>
      @left= new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      @left.position.set 0, 0, -100
      @left.rotation.x = 2
      @left.scale.set 0.01, 0.01, 0.01
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(@left)
    @loader.load 'models/wing-right.js', (geometries, materials) =>
      @right = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      @right.position.set 0, 0, -100
      @right.rotation.x = 2
      # wing.rotation.y = 2
      # wing.rotation.z = 2
      @right.scale.set 0.01, 0.01, 0.01
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(@right)
    @loader.load 'models/body.js', (geometries, materials) =>
      @body = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      @body.position.set 0, 0, -100
      @body.scale.set 0.01, 0.01, 0.01
      @body.rotation.x = 2
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(@body)

   render: =>
     if @left
       @left.rotation.x += 0.01

