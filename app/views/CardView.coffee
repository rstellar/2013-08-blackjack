class window.CardView extends Backbone.View

  className: 'card' #used to name the CSS class of the View element.

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @model.on 'change', => @render   #Q. Why no () like line below.
    #Re renders for any change. fat arrow => binds.
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
