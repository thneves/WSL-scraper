require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper_surfer
  wsl_url = 'https://www.worldsurfleague.com/athletes/tour/mct?year=2020'
  unparsed_page = HTTParty.get(wsl_url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  card = parsed_page.css('td.athlete-headshot-and-name')
  athletes = card.css('a.athlete-name').text
  country = card.css('span.athlete-country-name').text
  puts athletes
  puts country
end

# scraper

def scraper_events
  wsl_events = 'https://www.worldsurfleague.com/events'
  unparsed_page = HTTParty.get(wsl_events)

  events_parsed_page = Nokogiri::HTML(unparsed_page)
  events = events_parsed_page.css('td.event-schedule-details')
  events_name = events.css('span.event-schedule-details__event-name').text
  event_location = events.css('span.event-schedule-details__location').text

  puts events_name
  puts event_location
end

scraper_events
