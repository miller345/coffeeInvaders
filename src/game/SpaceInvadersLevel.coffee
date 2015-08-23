Scene = require "engine/Scene"
Invader = require "game/Invader"

class SpaceInvadersLevel extends Scene

  config:
    invaderSize: 20
    invaderCountX: 10
    invaderCountY: 5
    invaderPadding: 7
  state:
    invaderOffset: 0

  constructor: ->
    super()
    @invaders = []
    @addInvaders()

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

module.exports = SpaceInvadersLevel
