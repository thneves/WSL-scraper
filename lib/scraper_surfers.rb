require 'nokogiri'
require 'open-uri'
require_relative '../lib/modules.rb'
require_relative '../lib/scraper_init.rb'

# class to get Nokogiri wct rank info and turn into an array of hashes
class ScraperSurfer < Scraper
  include Formating

  def surfers_filter
    @total_list.each do |element|
      @hash_info = {
        ranking: element.css('td.athlete-rank').text,
        name: element.css('a.athlete-name').text,
        country: element.css('span.athlete-country-name').text,
        detail_info: element.css('a.headshot').map { |link| link['href'] }
      }
      @final_list.push(@hash_info)
    end
    @final_list.sort_by! { |element| element[:ranking].to_i }
  end
end
