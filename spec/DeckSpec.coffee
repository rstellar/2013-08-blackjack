describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      expect(deck.length).toBe 50
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 49
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 48
  
  describe 'stand', ->
    it "should not give a card and return play to dealer", ->
      expect(deck.length).toBe 50
      expect(deck.last()).toEqual hand.stand()
      expect(deck.length).toBe 50
      expect(deck.last()).toEqual hand.stand()
      expect(deck.length).toBe 50