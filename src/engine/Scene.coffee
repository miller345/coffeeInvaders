class Scene
  constructor: ->
    @components = []
  addComponent: (component) =>
    @components.push(component)
  draw: (context) =>
    context.clearRect(0, 0, context.canvas.width, context.canvas.height)
    for component in @components
      component.draw(context)

module.exports = Scene
