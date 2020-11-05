# frozen_string_literal: true

# module for methods of formating data from events or surf ranking
module Formating
  def format_surfers_info(list, filter)
    puts "\n"
    puts "World Championship Tour surfers from #{filter}: \n\n"
    list.each do |surfer|
      next unless surfer[:country] == filter

      puts "WCT Rank: #{surfer[:ranking]}"
      puts "Name: #{surfer[:name]}"
      puts "More info #{surfer[:detail_info]}"
      puts "\n"
    end
  end

  def format_events_info(info)
    info.each do |event|
      puts "Date: #{event[:date]}"
      puts "Event: #{event[:title]}"
      puts "Location: #{event[:location]}"
      puts "Tour: #{event[:tour]}"
      puts "\n"
    end
  end
end
