var quoteGroup = new app.quotesCollection();

var quoteGroupView = new app.allQuotesView({collection: quoteGroup});

quoteGroup.fetch({
  success: function() {
    $("#allQuotes").html(quoteGroupView.render().el);
  }
});