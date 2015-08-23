class Component
  constructor: (@x, @y, @width, @height, @color="yellow", @lineColor="black") ->
  draw: (context) =>
    context.beginPath()
    context.rect(@x, @y, @width, @height)
    context.fillStyle = @color
    context.fill()
    context.lineWidth = 1
    context.strokeStyle = @lineColor
    context.stroke()

module.exports = Component
