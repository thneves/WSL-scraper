require 'nokogiri'
require 'open-uri'
require_relative '../lib/modules.rb'
require_relative '../lib/scraper_init.rb'

# class take wsl events info from nokogiri and store into an array of hashes
class ScraperEvents < Scraper
  include Formating

  def wsl_events(country)
    @total_list.each do |element|
      next unless element.css('span.event-schedule-details__location').text.match?(country)

      @hash_info = {
        date: element.css('td.event-date-range').text, tour: element.css('span.event-tour-details__tour-name').text,
        title: element.css('span.event-schedule-details__event-name').text,
        location: element.css('span.event-schedule-details__location').text
      }
      @final_list.push(@hash_info)
    end
    @final_list
  end
  @final_list = 'None' if @final_list == []
end
