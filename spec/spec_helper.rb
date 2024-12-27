require 'bundler/setup'
require 'cities'

RSpec.configure do |config|
  # Treat symbols as metadata keys with true values
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Randomize test order
  config.order = :random

  # Set the formatter to progress
  config.formatter = :progress

  # Before all tests, set up Cities configuration
  config.before(:all) do
    data_path = ENV['DATA_PATH'] || File.expand_path('../data/cities', __dir__)
    Cities.data_path = data_path
    Cities.cache_data = false
  end
end
