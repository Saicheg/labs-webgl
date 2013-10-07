class window.MeadowController extends BaseController
  constructor: (init) ->
    @init = init
    @group = new THREE.Object3D()
    @loader = new THREE.JSONLoader()
    @createGrass()
    @init.scene.add(@group)

  createGrass: =>
    map = THREE.ImageUtils.loadTexture('/images/grass.jpg')
    groundMaterial = new THREE.MeshLambertMaterial({ map: map })
    window.planeSizeX = 1000
    window.planeSizeY = 1000

    plane = new THREE.Mesh(new THREE.PlaneGeometry(planeSizeX, planeSizeY), groundMaterial)
    plane.rotation.x = -Math.PI / 2
    # plane.receiveShadow = true
    @group.add(plane)
