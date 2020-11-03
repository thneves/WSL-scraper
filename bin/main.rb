#!/usr/bin/env ruby

require_relative '../lib/scraper_surfers.rb'
require_relative '../lib/scraper_events.rb'

puts 'Welcome to the World Surf League Brazil scraper'
puts "Type '1' to check all WSL events in Brazil\nType '2' to check Brazilian surfers in the Championship Tour"

mode = gets.chomp
choices = %w[1 2]
until choices.include?(mode)
  puts "Digit '1' or '2'"
  mode = gets.chomp.upcase
end

game_on = true

while game_on
  if mode == '1'
    events = ScraperEvents.new
    puts 'Type the name of the country to check WSL events: '
    events.scraping
    country = gets.chomp.split.map(&:capitalize).join(' ')
    events.brazil_events(country)
  elsif mode == '2'
    surfers = ScraperSurfer.new
    system 'cls'
    p surfers.surfers_list
  end
end
