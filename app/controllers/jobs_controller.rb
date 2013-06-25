require "httparty"

class JobsController < ApplicationController
  include HTTParty
  base_uri "http://api.careerbuilder.com"

  def jobrec
      @jobrecs = LoadRecommendations(:JobDID => params[:jobdid])
  end

end
