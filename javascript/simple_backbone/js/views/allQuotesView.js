var app = app || {};

app.allQuotesView = Backbone.View.extend({
  
  tagName: "section",

  render: function() {
    this.collection.each(this.addQuote, this);
    return this;
  },

  addQuote: function(quote) {
    var quoteView = new app.singleQuoteView({model: quote});
    this.$el.append(quoteView.render().el);
  }

});