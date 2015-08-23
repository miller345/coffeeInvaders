Game = require "engine/Game"
SpaceInvadersLevel = require "game/SpaceInvadersLevel"

class SpaceInvadersGame extends Game
  constructor: (target) ->
    l = new SpaceInvadersLevel()
    super(target, 10)
    @start(l)

module.exports = SpaceInvadersGame
