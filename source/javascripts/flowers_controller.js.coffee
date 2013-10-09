class window.FlowersController extends BaseController
  constructor: (init) ->
    @init = init
    @loader = new THREE.JSONLoader()
    @flowers = new THREE.Object3D()
    @init.scene.add(@flowers)
    @createFlowers()

  createFlowers: =>

    @loader.load 'models/flower/flower.js', (geometries, materials) =>
      for material in materials
        material.side = THREE.DoubleSide
      [@geometries, @materials] = [geometries, materials]

      @addFlower(160, -WORLD_SIZE/2, -400, 300)
      @addFlower(60, -WORLD_SIZE/2, -400, 250)
      @addFlower(-60, -WORLD_SIZE/2, -300, 250)
      @addFlower(0, -WORLD_SIZE/2, -200, 250)
      @addFlower(-360, -WORLD_SIZE/2, -100, 200)
      @addFlower(-180, -WORLD_SIZE/2, -100, 300)
      @addFlower(120, -WORLD_SIZE/2, -250, 250)
      @addFlower(-120, -WORLD_SIZE/2, 200, 200)
      @addFlower(-320, -WORLD_SIZE/2, -280, 280)
      @addFlower(180, -WORLD_SIZE/2, 0, 300)
      @addFlower(280, -WORLD_SIZE/2, 20, 260)
      @addFlower(340, -WORLD_SIZE/2, 60, 230)
      @addFlower(0, -WORLD_SIZE/2, -200, 230)
      @addFlower(20, -WORLD_SIZE/2, -200, 250)

  addFlower: (x,y,z, scale) =>
    model = new THREE.Mesh(@geometries, new THREE.MeshFaceMaterial(@materials))
    model.scale.set(scale, scale, scale)
    model.position.set(x,y,z)
    @flowers.add(model)

