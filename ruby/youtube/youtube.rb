require 'rubygems'
require 'unirest'

puts "Enter a search term:"
search_term = gets.chomp

# Please insert your API key below. Replace INSERT API KEY with valid YouTube Data API enabled API key.
results = Unirest.get("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=3&q=#{search_term}&type=video&key=
  
  INSERT API KEY

  ").body

p results