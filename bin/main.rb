#!/usr/bin/env ruby

require_relative '../lib/scraper_surfers.rb'
require_relative '../lib/scraper_events.rb'

puts 'Welcome to the World Surf League Brazil scraper'
puts "Type '1' to check all WSL events in Brazil\nType '2' to check Brazilian surfers in the Championship Tour"
mode = gets.chomp



if mode == '1'
  events = ScraperEvents.new
  p events.brazil_events
end

if mode == '2'
  surfers = ScraperSurfer.new
  p surfers.surfers_list
end
