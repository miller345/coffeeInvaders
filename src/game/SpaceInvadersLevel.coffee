Scene = require "engine/Scene"
Invader = require "game/Invader"
Mug = require "game/Mug"

class SpaceInvadersLevel extends Scene

  config:
    mugSize: 40
    invaderSize: 20
    invaderCountX: 10
    invaderCountY: 5
    invaderPadding: 7
  state:
    invaderOffset: 0

  constructor: ->
    super()
    @invaders = []
    @addMug()
    @addInvaders()

  addMug: =>
    @mug = new Mug(100, 100, @config.mugSize)
    @addComponent(@mug)

  addInvader: (x, y) =>
    invader = new Invader x, y, @config.invaderSize
    @invaders.push(invader)
    @addComponent(invader)

  addInvaders: () =>
    for x in [1..@config.invaderCountX]
      for y in [1..@config.invaderCountY]
        spacing = (@config.invaderSize+@config.invaderPadding)
        @addInvader spacing*x, spacing*y

  update: (u, du) =>
    for invader in @invaders
      invader.y += du

  keyDown: (key, keycode) =>
    console.log key, keycode, "down"

  keyUp: (key, keycode) =>
    console.log key, keycode, "up"


module.exports = SpaceInvadersLevel
