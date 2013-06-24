require "httparty"

class ApplicationsController < ApplicationController
  include HTTParty
  base_uri "http://api.careerbuilder.com"

  def index
  end

  def show
    @firstname = params[:fn]
    @lastname = params['ln']
    @jobDID = params['jobdid']
  end

  def new
  end

end
