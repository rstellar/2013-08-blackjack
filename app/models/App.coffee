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
    # this.get('playerHand').on('bust', this.bust);

    #bust should reset state of app, another method should act on the change.


  dealerTurn: ->
    dealerHand = (@get 'dealerHand')
    
    
    # if dealerHand.scores > 21
    #   alert('Dealer Bust!')
    # if dealerHand.scores >= 17

      #dealerTurn keeps hitting until reaches 17 or bust


