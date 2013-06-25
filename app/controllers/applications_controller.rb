require "httparty"

class ApplicationsController < ApplicationController
  include HTTParty
  base_uri "http://api.careerbuilder.com"

  def index
  end

  def show
    @ApplicantName = params[:ApplicantName]
    @ApplicantEmail = params[:ApplicantEmail]
    @Resume = params[:Resume]
    @CoverLetter = params[:CoverLetter]
    @jobDID = params[:jobdid]

    #@applyformurl = 'http://api.careerbuilder.com/v1/application/form?DeveloperKey=WDHL2LS5XZF8GYFHK1SB&JobDID=J3H1CQ6G7W3C751X29V'

    @applyformurl = 'http://api.careerbuilder.com/v1/application/form?DeveloperKey=WDHL2LS5XZF8GYFHK1SB&JobDID='.to_s() + @jobDID
  end


  def new
  end

end
