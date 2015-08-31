Scene = require "engine/Scene"
Invader = require "game/Invader"
Mug = require "game/Mug"

class SpaceInvadersLevel extends Scene

  config:
    mugSize: 40
    mugSpeed: 3
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
    @mug = new Mug(210, 450, @config.mugSize)
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
    #for invader in @invaders
    #  invader.y += du
    if @left and not @right
      @mug.x -= 1 * @config.mugSpeed
    else if @right and not @left
      @mug.x += 1 * @config.mugSpeed


  keyDown: (key, keycode) =>
    switch key
      when "left" then @left = true
      when "right" then @right = true

  keyUp: (key, keycode) =>
    switch key
      when "left" then @left = false
      when "right" then @right = false


module.exports = SpaceInvadersLevel
