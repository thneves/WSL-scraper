# frozen_string_literal: true

require_relative '../lib/modules.rb'
require_relative '../lib/scraper_events.rb'
require_relative '../lib/scraper_surfers.rb'
require_relative '../lib/scraper_init.rb'

describe Scraper do
  let(:url) { 'https://www.worldsurfleague.com/events' }
  let(:url2) { 'https://www.worldsurfleague.com/athletes/tour/mct?year=2020' }
  let(:test_events) { ScraperEvents.new(url) { extend Formating } }
  let(:test_surfer) { ScraperSurfer.new(url2) { extend Formating } }
  describe '#initialize' do
    it 'it create a new instance of a Object ' do
      expect(test_events).to be_a(Object)
    end
  end

  describe '#surfers_filter' do
    it 'takes XML info, filter into a hash and push the hash into an array returning the array' do
      expect(test_surfer.surfers_filter).to be_a(Array)
    end
  end

  describe '#wsl_events' do
    it 'receives a String argument, filter into a hash, push into array and return the array ' do
      expect(test_events.wsl_events('Brazil')).to be_a(Array)
    end
  end
end
