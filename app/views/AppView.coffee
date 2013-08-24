class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="reset-button">Reset</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> 
      @model.get('playerHand').hit()
    "click .stand-button": -> @model.dealerTurn()
    "click .reset-button": -> alert "Refresh the screen"  
    # stand ()currently undefined
    # probably add to Hand.coffee

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
      #Grabs the hand data for dealer and player from repsective models