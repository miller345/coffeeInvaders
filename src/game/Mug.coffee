Component = require "engine/Component"

class Mug extends Component
  constructor: (x,y,size) ->
    super x, y, size, size, "blue"

module.exports = Mug
