require_relative '../lib/scraper_surfers.rb'
require_relative '../lib/scraper_events.rb'
require_relative '../lib/modules.rb'

describe Formating do
  let(:wct_ranking) { 'https://www.worldsurfleague.com/athletes/tour/mct?year=2020' }
  let(:wsl_events) { 'https://www.worldsurfleague.com/events' }
  let(:test_surf_rank) { ScraperSurfer.new(wct_ranking) { extend Formating } }
  let(:test_events) { ScraperEvents.new(wsl_events) { extend Formating } }
  let(:surfer_info) { [{ ranking: '1', name: 'Programerson', country: 'Brazil', detail_info: ['www.more.com.br'] }] }
  let(:event_info) { [{ date: '22 Oct', title: 'Microverse Surf', location: 'Brazil', tour: 'Rails Developers Tour' }] }

  describe '#format_surfers_info' do
    it 'receives an array and return a filtered message by the second argument' do
      expect(test_surf_rank.format_surfers_info(surfer_info, 'Brazil')).to be_a(Array)
    end

    it 'returns an empty list' do
      expect(test_surf_rank.format_surfers_info(surfer_info, 'Netherlands')).to be_a(String)
    end
  end

  describe '#format_events_info' do
    it 'receives an array and return a filtered message' do
      expect(test_events.format_events_info(event_info)).to be_an(Array)
    end
  end
end
