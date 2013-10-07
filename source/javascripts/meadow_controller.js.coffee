class window.MeadowController
  constructor: (init) ->
    @init = init
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
