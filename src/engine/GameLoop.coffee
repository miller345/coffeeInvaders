class GameLoop
  constructor: (@onUpdate, @onDraw, @fps=60, @ups=60) ->
    #ups = updates per sec
    #fps = frames per sec

  start: =>
    #reset values
    @startTime = new Date().getTime()
    @lastFrame = 0
    @lastTime = 0
    @lastUpdate = 0
    #start loop
    @loopId = window.requestAnimationFrame(@tick)

  stop: =>
    window.cancelAnimationFrame(@loopId)

  tick: (timestamp) =>
    @currentTime = new Date().getTime() #TODO - use timestamp
    @elapsedTime = @currentTime - @startTime
    @currentUpdate = Math.floor(@elapsedTime/(1000/@ups))
    if @currentUpdate isnt @lastUpdate then @onUpdate?(@currentUpdate, @currentUpdate-@lastUpdate)
    @currentFrame = Math.floor(@celapsedTime/(1000/@fps))
    if @currentFrame isnt @lastFrame then @onDraw?(@currentFrame, @currentFrame-@lastFrame)
    @lastTime = @currentTime
    @lastUpdate = @currentUpdate
    @lastFrame = @currentFrame
    @loopId = window.requestAnimationFrame(@tick)

module.exports = GameLoop
