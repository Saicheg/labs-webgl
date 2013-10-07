class window.MeadowController extends BaseController
  constructor: (init) ->
    @init = init
    # @group = new THREE.Object3D()
    # @loader = new THREE.JSONLoader()
    # @createGrass()
    @createCube()
    # @init.scene.add(@group)

  createGrass: =>
    map = THREE.ImageUtils.loadTexture('/images/grass.jpg')
    groundMaterial = new THREE.MeshLambertMaterial({ map: map })
    window.planeSizeX = 1000
    window.planeSizeY = 1000

    plane = new THREE.Mesh(new THREE.PlaneGeometry(planeSizeX, planeSizeY), groundMaterial)
    plane.rotation.x = -Math.PI / 2
    # plane.receiveShadow = true
    @group.add(plane)

  createCube: =>
    urlPrefix = "images/sky/"
    urls = [ urlPrefix + "posx.jpg", urlPrefix + "negx.jpg",
             urlPrefix + "posy.jpg", urlPrefix + "negy.jpg",
             urlPrefix + "posz.jpg", urlPrefix + "negz.jpg" ]

    textureCube = THREE.ImageUtils.loadTextureCube(urls)

    skyGeometry = new THREE.CubeGeometry( 5000, 5000, 5000 )

    materialArray = []
    for url in urls
      materialArray.push(new THREE.MeshBasicMaterial({
                          map: THREE.ImageUtils.loadTexture(url),
                          side: THREE.BackSide
                        }))
    skyMaterial = new THREE.MeshFaceMaterial( materialArray )
    skyBox = new THREE.Mesh( skyGeometry, skyMaterial )

    @init.scene.add(skyBox)
