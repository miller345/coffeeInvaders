GameLoop = require "engine/GameLoop"

class Game
  constructor: (container, fps=60) ->
    @gameLoop = new GameLoop(@update,@draw,fps)
    @canvas = document.createElement("canvas")
    @canvas.width = 500
    @canvas.height = 500
    container.appendChild(@canvas)
    @context = @canvas.getContext("2d")
  start: (scene) =>
    @currentScene = scene
    @gameLoop.start()
  update: (t,dt) =>
    @currentScene?.update?(t,dt)
  draw: (t,dt) =>
    @currentScene?.draw?(@context,t,dt)
  stop: =>
    @gameLoop.stop()

module.exports = Game
