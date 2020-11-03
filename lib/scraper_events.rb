require 'nokogiri'
require 'httparty'

class ScraperEvents
  attr_reader :events, :events_name, :event_location

  def initialize
    @events_list = []
    @event = {}
    wsl_events = 'https://www.worldsurfleague.com/events'
    unparsed_page = HTTParty.get(wsl_events)
    events_parsed_page = Nokogiri::HTML(unparsed_page)
    @events = events_parsed_page.css('div.event-schedule-details__wrap')
    @odd_events = events_parsed_page.css('tr.odd')
    @even_events = events_parsed_page.css('tr.even')
    # tours = events_parsed_page.css('td.event-tour-details')
    # tour_name = tours.css('span.event-tour-details__tour-name').text
    # puts @odd_events.text
  end

  def brazil_events
    @odd_events.each do |element|
      next unless element.css('span.event-schedule-details__location').text.include?('Brazil')

      @event = {
        date: element.css('td.event-date-range').text,
        title: element.css('span.event-schedule-details__event-name').text,
        location: element.css('span.event-schedule-details__location').text,
        tour: element.css('span.event-tour-details__tour-name').text
      }

      @events_list.push(@event)
    end
    @events_list
  end
end

events = ScraperEvents.new

puts events.brazil_events
