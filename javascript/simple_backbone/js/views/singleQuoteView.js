var app = app || {};

app.singleQuoteView = Backbone.View.extend({
  tagName: "article",
  className: "quoteListItem",

  template: _.template( $("#quoteElement").html() ),

  render: function() {
    var quoteTemplate = this.template(this.model.toJSON());
    this.$el.html(quoteTemplate);
    return this;
  }
});