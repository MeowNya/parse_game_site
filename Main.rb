#!/usr/bin/env ruby


require 'open-uri'
require 'nokogiri'


def search_games(game_name)
  url = 'https://www.gamespot.com/search/?i=site&q=' + game_name
  doc = Nokogiri::HTML(open(url))
  puts "Search '" + game_name + '\':'
  doc.css('.media-title').each do |node|
    puts '    ' + node.css('a').text + ' ' + URI.join(url, node.css('a').attr('href')).to_s
  end
  puts ''
end

search_games('dark souls')
search_games('sims 2')
