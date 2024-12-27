require 'spec_helper'
require 'countries'

describe 'Cities::City Configuration' do
  context 'Cache Data Flag' do
    subject(:cache_data_flag) { Cities.cache_data? }

    it 'is false by default' do
      expect(cache_data_flag).to be_falsey
    end
  end
end