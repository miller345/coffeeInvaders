GameLoop = require "engine/GameLoop"
Keyboard = require "engine/Keyboard"

class Game
  constructor: (container, width, height, fps=60) ->
    @gameLoop = new GameLoop(@update,@draw,fps)
    @canvas = document.createElement("canvas")
    @canvas.width = width
    @canvas.height = height
    container.appendChild(@canvas)
    @context = @canvas.getContext("2d")
    @keyboard = new Keyboard()
    @keyboard.startListening(@keyDown, @keyUp)
  start: (scene) =>
    @currentScene = scene
    @gameLoop.start()
  update: (t,dt) =>
    @currentScene?.update?(t,dt)
  draw: (t,dt) =>
    @currentScene?.draw?(@context,t,dt)
  stop: =>
    @gameLoop.stop()
  keyDown: (key, keycode, event) =>
    @currentScene?.keyDown?(key, keycode, event)
  keyUp: (key, keycode) =>
    @currentScene?.keyUp?(key, keycode, event)

module.exports = Game
