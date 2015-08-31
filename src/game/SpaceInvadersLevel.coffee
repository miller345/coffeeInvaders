Scene = require "engine/Scene"
Invader = require "game/Invader"
Mug = require "game/Mug"
random = require "engine/random"

class SpaceInvadersLevel extends Scene

  config:
    mugSize: 40
    mugSpeed: 3
    fallSpeed: 5
    fallFrequency: 100 #every x updates
    fallChance: 0.1
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
    @lastFall = 0 #last update that invader fell

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
    if @left and not @right
      @mug.x -= du * @config.mugSpeed
    else if @right and not @left
      @mug.x += du * @config.mugSpeed

    if (u - @lastFall) > @config.fallFrequency
      shouldFall = true
      @lastFall = u
    #pick invaders to fall
    indexToFall = random.between(0, @invaders.length)
    for invader, index in @invaders
      if shouldFall and (indexToFall is index)
        invader.falling = true
      #keep invader falling
      if invader.falling
        invader.y += du * @config.fallSpeed

  keyDown: (key, keycode) =>
    switch key
      when "left" then @left = true
      when "right" then @right = true

  keyUp: (key, keycode) =>
    switch key
      when "left" then @left = false
      when "right" then @right = false


module.exports = SpaceInvadersLevel
