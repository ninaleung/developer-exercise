var quotesCollection = Backbone.PageableCollection.extend({
  url: "https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json",
  mode: "client",
  state: {
    pageSize: 15
  }
});

var quoteGroup = new quotesCollection();

var columns = [{
  name: "quote",
  cell: "string"
}, {
  name: "context",
  cell: "string"
}, {
  name: "source",
  cell: "string"
}, {
  name: "theme",
  cell: "string"
}];

var grid = new Backgrid.Grid({
  columns: columns,
  collection: quoteGroup
});