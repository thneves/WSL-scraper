require 'nokogiri'
require 'open-uri'

# Class Parent to initialize instance objects
class Scraper
  attr_accessor :url, :final_list, :hash_info, :total_list

  def initialize(url)
    @final_list = []
    @hash_info = {}
    @url = url
    @total_list = scraping
  end

  private

  def scraping
    unparsed_page = URI.open(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    odd_list = parsed_page.css('tr.odd')
    even_list = parsed_page.css('tr.even')
    @total_list = even_list + odd_list
  end
end
