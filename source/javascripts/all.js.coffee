#= require_tree .
#= require_self

window.onload = ->
  body = document.getElementsByTagName('body')[0]
  body.style.width = window.innerWidth + 'px'
  body.style.height = window.innerHeight + 'px'

  controller = new ButterflyController()
  controller.run()
