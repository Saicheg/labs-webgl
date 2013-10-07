class window.ButterflyController extends BaseController
  constructor: (init) ->
    @init = init
    @butterfly = new THREE.Object3D()
    @init.scene.add(@butterfly)
    @loader = new THREE.JSONLoader()
    @createButterfly()

  createButterfly: =>
    @loader.load 'models/butterfly.js', (geometries, materials) =>
      butterfly = new THREE.Mesh(geometries, new THREE.MeshFaceMaterial(materials))
      butterfly.position.set 0, 0, -300
      # butterfly.scale.set 1, 1, 1
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(butterfly)
