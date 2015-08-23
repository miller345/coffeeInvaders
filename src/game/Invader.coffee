Component = require "engine/Component"

class Invader extends Component
  constructor: (x,y,size) ->
    super x, y, size, size, "pink"

module.exports = Invader
