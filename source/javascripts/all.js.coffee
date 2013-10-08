#= require_tree .
#= require_self

window.onload = ->
  body = document.getElementsByTagName('body')[0]
  body.style.width = window.innerWidth + 'px'
  body.style.height = window.innerHeight + 'px'

  window.app = new ApplicationController()
  app.run()
