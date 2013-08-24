#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model


  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'bust', @bust, @
    (@get 'dealerHand').on 'bust', @bust, @

  bust: (arg)->
    if arg is (@get 'playerHand')
      alert('You busted! Game Over, you lose!')
    if arg is (@get 'dealerHand')
      alert('The Dealer went bust -- You Win!')   
    # #reset player hand, reset dealer hand, alert player

    #TODO - bust should reset state of app, another method should act on the change.

  evaluate: ->
    dealerScore = (@get 'dealerHand').scores()[0]
    playerScore = (@get 'playerHand').scores()[0]
    if dealerScore > 21
      alert('Dealer is Bust -- You win!')
    else if dealerScore >= playerScore
      alert('Dealer Wins!')

  newHand: ->
    console.log("newHand Fired")
    @set 'playerHand', (@get 'deck').dealPlayer()
    @set 'dealerHand', (@get 'deck').dealDealer()

    
  dealerTurn: ->
    dealerHand = (@get 'dealerHand')
    unrevealed = dealerHand.models[0].get('value')
    while dealerHand.scores()[0] + unrevealed < 17
      dealerHand.hit()
    dealerHand.models[0].flip()
    @evaluate()



    
    
    #TODO - make stand button disable after first click.

    # if dealerHand.scores > 21
    #   alert('Dealer Bust!')
    # if dealerHand.scores >= 17

