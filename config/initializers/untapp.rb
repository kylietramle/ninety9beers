Untappd.configure do |config|
  config.client_id = ENV['CLIENT_ID']
  config.client_secret = ENV['CLIENT_KEY']
  config.gmt_offset = -5
end