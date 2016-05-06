class BeersController < ApplicationController
  def index
    @secret = ENV['API_KEY']
  end
end
