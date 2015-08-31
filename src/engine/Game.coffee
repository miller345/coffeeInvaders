GameLoop = require "engine/GameLoop"
Keyboard = require "engine/Keyboard"

class Game
  constructor: (container, fps=60) ->
    @gameLoop = new GameLoop(@update,@draw,fps)
    @canvas = document.createElement("canvas")
    @canvas.width = 500
    @canvas.height = 500
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
  keyDown: (key, keycode) =>
    @currentScene?.keyDown?(key, keycode)
  keyUp: (key, keycode) =>
    @currentScene?.keyUp?(key, keycode)

module.exports = Game
