require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  wsl_url = 'https://www.worldsurfleague.com/athletes/tour/mct?year=2020'
  unparsed_page = HTTParty.get(wsl_url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  ranking_list = parsed_page.css('div.table-outer-wrap')
  puts ranking_list
end

scraper
