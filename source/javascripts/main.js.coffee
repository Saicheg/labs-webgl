window.onload = ->

  body = document.getElementsByTagName('body')[0]
  body.style.width = window.innerWidth + 'px'
  body.style.height = window.innerHeight + 'px'

  initialize = ->
    window.start = Date.now()

    window.init = new ThreeInit
    init.createScene()
    init.createCamera()
    init.createRenderer()

    window.cube = new THREE.Mesh( new THREE.CubeGeometry( 200, 200, 200 ), new THREE.MeshNormalMaterial() )
    cube.position.y = 150

    init.scene.add(cube)

    window.stats = new Stats()
    stats.domElement.style.position = 'absolute'
    stats.domElement.style.top = '0px'
    init.container.appendChild( stats.domElement )

  render = ->
    cube.rotation.x += 0.02
    cube.rotation.y += 0.0225
    cube.rotation.z += 0.0175

    dtime = Date.now() - start
    cube.scale.x  = 1.0 + 0.3*Math.sin(dtime/300)
    cube.scale.y  = 1.0 + 0.3*Math.sin(dtime/300)
    cube.scale.z  = 1.0 + 0.3*Math.sin(dtime/300)

    init.render()

  animate = ->
    render()
    requestAnimationFrame(animate)
    stats.update()

  initialize()
  animate()
