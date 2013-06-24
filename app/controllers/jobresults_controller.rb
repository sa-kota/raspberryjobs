require "httparty"

class JobresultsController < ApplicationController
  include HTTParty
  base_uri "http://api.careerbuilder.com"

  def index
    @jobresults = jobsearch()
  end

end
