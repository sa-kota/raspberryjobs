require "httparty"

class JobdetailsController < ApplicationController
  include HTTParty

  def index
  end

  def show
    @jobdetail = jobdetail(:DID => params[:jobDID])
  end

  def new
  end

end
