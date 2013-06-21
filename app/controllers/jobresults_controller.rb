require "httparty"

class JobresultsController < ApplicationController
  include HTTParty

  def index
    @jobresults = jobsearch()
  end

end
