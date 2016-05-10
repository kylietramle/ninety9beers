class Beer < ActiveRecord::Base
  def self.api_call
    BreweryDB::Client.new { |config| config.api_key = ENV['API_KEY'] }
  end
end
