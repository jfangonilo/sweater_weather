VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<FLICKR_KEY>") { ENV['FLICKR_KEY'] }
  config.filter_sensitive_data("<GOOGLE_GEOCODING_KEY>") { ENV['GOOGLE_GEOCODING_KEY'] }
  config.filter_sensitive_data("<GOOGLE_DIRECTIONS_KEY>") { ENV['GOOGLE_DIRECTIONS_KEY'] }
  config.filter_sensitive_data("<DARKSKY_KEY>") { ENV['DARKSKY_KEY'] }
  config.filter_sensitive_data("<YELP_KEY>") { ENV['YELP_KEY'] }
end