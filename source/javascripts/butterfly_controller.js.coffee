class window.ButterflyController extends BaseController
  constructor: (init) ->
    @init = init
    @butterfly = new THREE.Object3D()
    @init.scene.add(@butterfly)
    @loader = new THREE.JSONLoader()
    @butterfly.rotation.x = Math.PI / 2
    @butterfly.rotation.y = Math.PI
    @createButterfly()

  createButterfly: =>
    @loader.load 'models/wing-left.js', (geometries, materials) =>
      for material in materials
        material.side = THREE.DoubleSide
      @left= new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      @left.direction = 'up'
      @setParams(@left)
      @butterfly.add(@left)

    @loader.load 'models/wing-right.js', (geometries, materials) =>
      for material in materials
        material.side = THREE.DoubleSide
      @right = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      @right.direction = 'up'
      @setParams(@right)
      @butterfly.add(@right)

    @loader.load 'models/body.js', (geometries, materials) =>
      @body = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      @setParams(@body)
      @butterfly.add(@body)

   setParams: (obj) =>
     obj.scale.set(0.01, 0.01, 0.01)

   leftWingDirection: (wing) =>
     if wing.direction == 'up' && wing.rotation.z <= 0.75
       'up'
     else if wing.direction == 'down' && wing.rotation.z >= 0.0
       'down'
     else if wing.direction == 'up'
       'down'
     else
       'up'

   rightWingDirection: (wing) =>
     if wing.direction == 'up' && wing.rotation.z >= -0.75
       'up'
     else if wing.direction == 'down' && wing.rotation.z <= 0.0
       'down'
     else if wing.direction == 'up'
       'down'
     else
       'up'

   flitterLeft: (wing) =>
     direction = @leftWingDirection(wing)
     wing.direction = direction
     if direction == 'up'
       wing.rotation.z += 0.01
     else if direction == 'down'
       wing.rotation.z -= 0.01

   flitterRight: (wing) =>
     direction = @rightWingDirection(wing)
     wing.direction = direction
     if direction == 'up'
       wing.rotation.z -= 0.01
     else if direction == 'down'
       wing.rotation.z += 0.01

   render: =>
     if @left && @right
       @flitterLeft(@left)
       @flitterRight(@right)
