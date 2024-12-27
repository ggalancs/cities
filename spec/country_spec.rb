require 'spec_helper'
require 'countries'

describe ISO3166::Country do
  context 'City Data' do
    it 'returns the correct number of cities for Wallis and Futuna (WF)' do
      expect(ISO3166::Country.search('WF').cities.length).to eq(39)
    end

    it 'returns an empty hash for Vatican City (VA) with no cities' do
      expect(ISO3166::Country.search('VA').cities).to eq({})
    end
  end
end

