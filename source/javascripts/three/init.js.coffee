class window.ThreeInit

  constructor: (options) ->
    options ||= {}
    Detector.addGetWebGLMessage() unless Detector.webgl
    @options = options
    @container = document.getElementById('canvas')

    @createScene()
    @createCamera()
    @createRenderer()
    @createLight()

  createRenderer: =>
    @options.renderer ||= {}

    # Create the Three.js renderer, add it to our div
    @renderer = new THREE.WebGLRenderer(@options.renderer)
    @renderer.setSize @container.offsetWidth, @container.offsetHeight
    # @renderer.setClearColor 0xccdcec, 1

    # @renderer.shadowMapEnabled = true
    # @renderer.shadowMapSoft = true

    @container.appendChild(@renderer.domElement)

  createScene: =>
    @options.scene ||= {}

    # Create a new Three.js scene
    @scene = new THREE.Scene(@options.scene)

  createCamera: =>
    cam = @options.camera || {}

    cam.angle  ||= 75
    cam.aspect ||= @container.offsetWidth / @container.offsetHeight
    cam.min    ||= 0.1
    cam.max    ||= 1000

    cam.x      ||= 0
    cam.y      ||= 250
    cam.z      ||= 600

    @camera = new THREE.PerspectiveCamera cam.angle, cam.aspect, cam.min, cam.max
    @camera.position.set cam.x, cam.y, cam.z

    # # Set default options
    # cam = @options.camera || {}

    # cam.angle  ||= 45
    # cam.aspect ||= @container.offsetWidth / @container.offsetHeight
    # cam.max    ||= 4000

    # cam.x      ||= 0
    # cam.y      ||= 0
    # cam.z      ||= 3

    # # Create a camera and add it to the scene
    # edgeLen = 20
    # # @camera = new THREE.OrthographicCamera( -edgeLen*cam.aspect, edgeLen*cam.aspect, edgeLen, -edgeLen, 1, 1000 )
    # @camera = new THREE.PerspectiveCamera cam.angle, cam.aspect, cam.min, cam.max
    # @camera.position.set cam.x, cam.y, cam.z

    # @camera.lookAt({ x: 0, y: 10, z: 0 })
    # @scene.add @camera

  createLight: ->
    # light = @options.light || {}

    directionalLight = new THREE.DirectionalLight(0xFFFFFF)
    directionalLight.position.set(0, 70, 100).normalize()
    @scene.add(directionalLight)

    ambient = new THREE.AmbientLight(0x666666)
    @scene.add(ambient)
    # light.intensity || = 1.5

    # light.x         || = 0
    # light.y         || = 0
    # light.z         || = 1

    # # Create a directional light to show off the object
    # @light = new THREE.SpotLight light.color, light.intensity
    # @light.position.set light.x, light.y, light.z
    # @light.castShadow = true
    # @light.shadowDarkness = 0.95
    # @light.shadowMapHeight = 2048
    # @light.shadowMapWidth = 2048
    # # @light.shadowCameraVisible = true

    # aspect = @container.offsetWidth / @container.offsetHeight
    # shadowWidth = 40
    # # @camera = new THREE.OrthographicCamera( -edgeLen*cam.aspect, edgeLen*cam.aspect, edgeLen, -edgeLen, 1, 1000 )
    # @light.shadowCameraRight    =  shadowWidth * aspect
    # @light.shadowCameraLeft     = -shadowWidth * aspect
    # @light.shadowCameraTop      =  shadowWidth
    # @light.shadowCameraBottom   = -shadowWidth

    # @scene.add @light


  render: ->
    # Render it
    @renderer.render @scene, @camera
