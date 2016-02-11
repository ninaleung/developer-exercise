var app = app || {};

app.quotesCollection = Backbone.Collection.extend({
  model: app.singleQuote
});