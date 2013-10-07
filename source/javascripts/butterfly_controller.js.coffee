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
      butterfly.rotation.x = Math.PI / 2
      butterfly.rotation.y = Math.PI

      butterfly.position.set 200, 500, 0
      butterfly.scale.set 2.5, 2.5, 2.5
      # butterfly.overdraw = true
      # butterfly.castShadow = true
      # butterfly.receiveShadow = true
      @butterfly.add(butterfly)
