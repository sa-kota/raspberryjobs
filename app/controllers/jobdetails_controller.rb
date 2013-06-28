require "httparty"

class JobdetailsController < ApplicationController
  include HTTParty
  base_uri "http://api.careerbuilder.com"

  def index
  end

  def show
    @jobdetail = jobdetail(:DID => params[:jobDID])
  end

  def apply
    @jobDID = params[:jobDID]
    @applyformurl = 'http://api.careerbuilder.com/v1/application/form?DeveloperKey=WDHL2LS5XZF8GYFHK1SB&JobDID='.to_s() + @jobDID
  end

end
