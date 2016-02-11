var wolfQuote = new app.singleQuote({
  quote: "That's thirty minutes away. I'll be there in ten.",
  context: "Pulp Fiction",
  source: "The Wolf",
  theme: "movies"
});

var dukeQuote = new app.singleQuote({
  quote: "It's time to kick ass and chew bubblegum.",
  context: "Duke Nukem 3D",
  source: "Duke Nukem",
  theme: "games"
});

var fightClubQuote = new app.singleQuote({
  quote: "The first rule of Fight Club is: you do not talk about Fight Club. The second rule of Fight Club is: you DO NOT talk about Fight Club.",
  context: "Fight Club",
  source: "Tyler Durden",
  theme: "movies"
});

var quoteGroup = new app.quotesCollection([
  wolfQuote, dukeQuote, fightClubQuote
]);