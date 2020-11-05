# frozen_string_literal: true

# module for methods to formating data from events or surf ranking
module Formating
  def format_surfers_info(list, filter)
    list.each do |surfer|
      next unless surfer[:country] == filter

      puts "WCT Rank: #{surfer[:ranking]}\nName: #{surfer[:name]}\nMore info #{surfer[:detail_info]}\n\n"
    end
  end

  def format_events_info(info)
    info.each do |event|
      puts "Date: #{event[:date]}\nEvent: #{event[:title]}\nLocation: #{event[:location]}\nTour: #{event[:tour]}\n\n"
    end
  end
end
