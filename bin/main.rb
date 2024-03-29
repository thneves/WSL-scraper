#!/usr/bin/env ruby

require_relative '../lib/scraper_surfers.rb'
require_relative '../lib/scraper_events.rb'

program_on = true

while program_on

  puts 'Welcome to the World Surf League scraper'
  puts "Type '1' to check all WSL events by country\nType '2' to check surfers by country in the Championship Tour"

  mode = gets.chomp
  choices = %w[1 2]
  until choices.include?(mode)
    puts "Digit '1' or '2'"
    mode = gets.chomp.upcase
  end

  wct_ranking = 'https://www.worldsurfleague.com/athletes/tour/mct?year=2020'
  wsl_events = 'https://www.worldsurfleague.com/events?all=1&year=2022'

  if mode == '1'
    events = ScraperEvents.new(wsl_events)
    puts 'Type the name of the country to check WSL events(ex: South Africa): '
    country = gets.chomp.split.map(&:capitalize).join(' ')
    puts "\n"
    puts "These are the events around the year in #{country}: \n\n"
    puts events.format_events_info(events.wsl_events(country))
    program_on = false
  elsif mode == '2'
    surfer = ScraperSurfer.new(wct_ranking)
    puts 'Type the name of the country to check WCT surfers: '
    puts 'Available countries: Australia, Brazil, France, Japan, United States, Hawaii, Italy, South Africa, Portugal'
    country = gets.chomp.split.map(&:capitalize).join(' ')
    puts "\n"
    puts "World Championship Tour surfers from #{country}: \n\n"
    puts surfer.format_surfers_info(surfer.surfers_filter, country)
    program_on = false
  end

  puts 'Do you wanna start again? Y/N'
  reset = gets.chomp.upcase
  choices = %w[Y N]
  until choices.include?(reset)
    puts "Digit 'Y' or 'N'"
    reset = gets.chomp.upcase
  end

  if reset == 'Y'
    system 'clear'
    system 'cls'
    program_on = true
  end
  puts "Thanks for using WSL scraper!\nFor more info access: https://www.worldsurfleague.com/" if reset == 'N'
end
