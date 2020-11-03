require 'nokogiri'
require 'httparty'

class ScraperSurfer
  attr_reader :surfers, :text

  def initialize
    @surfers = []
    wsl_url = 'https://www.worldsurfleague.com/athletes/tour/mct?year=2020'
    unparsed_page = HTTParty.get(wsl_url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    card = parsed_page.css('td.athlete-headshot-and-name')
    @text = card.css('div.avatar-text')
  end

  def surfers_list
    @text.each do |element|
      if element.text.include?('Brazil')
        name = element.text.gsub('Brazil', '')
        @surfers.push(name)
      end
    end
    @surfers
  end
end

brazil = ScraperSurfer.new

puts brazil.surfers_list
