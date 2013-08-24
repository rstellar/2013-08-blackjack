#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model


  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'bust', @bust, @
    console.log @

  bust: (arg)->
    if arg is (@get 'playerHand')
      console.log ('playerHand went bust')
    if arg is (@get 'dealerHand')
      console.log ('dealerHand went bust')   
    # #reset player hand, reset dealer hand, alert player
    # this.get('playerHand').on('bust', this.bust);

