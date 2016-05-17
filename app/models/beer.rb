class Beer < ActiveRecord::Base
  belongs_to :user
  
  def self.api_call
    BreweryDB::Client.new { |config| config.api_key = ENV['API_KEY'] }
  end
end
