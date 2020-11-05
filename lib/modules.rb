# frozen_string_literal: true

# module for methods to formating data from events or surf ranking
module Formating
  def format_surfers_info(list, filter)
    count = 0
    message = []
    list.each do |surfer|
      next unless surfer[:country] == filter

      count += 1
      message.push("WCT Rank: #{surfer[:ranking]}\nName: #{surfer[:name]}\nMore info #{surfer[:detail_info]}\n\n")
    end
    message = "No surfers from this country or is not even a country ;)\n\n" if count.zero?
    message
  end

  def format_events_info(info)
    message = []
    info.each do |event|
      message.push("Date: #{event[:date]}\nEvent: #{event[:title]}\nLocation: #{event[:location]}\nTour: #{event[:tour]}\n\n")
    end
    message = "No events in this country or is not even a country ;)\n\n" if info.empty?
    message
  end
end
