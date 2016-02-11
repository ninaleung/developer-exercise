var quotesCollection = Backbone.PageableCollection.extend({
  url: "https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json",
  mode: "client",
  state: {
    pageSize: 15
  }
});

var quoteGroup = new quotesCollection();