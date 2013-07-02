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
    @Questions = LoadQuestionForJob(:JobDID => params[:jobDID])
  end

  def applyfinish
    xml_resp = build_xml(params)
    @result = ApplyForAJob(xml_resp)
  end

  def build_xml(options)
    xml =     "<RequestApplication>"
    xml +=       "<DeveloperKey>#{DEVELOPERKEY}</DeveloperKey>"
    xml +=       "<JobDID>#{options[:jobdid]}</JobDID>"
    xml +=       "<Test>true</Test>"
    xml +=       "<SiteID />"
    xml +=       "<CoBrand />"
    xml +=       "<Responses>"

    params.each do |key,value|
      xml +=         "<Response>"
      xml +=          "<QuestionID>#{key}</QuestionID>"
      xml +=          "<ResponseText>#{value}</ResponseText>"
      xml +=        "</Response>"
    end

    xml +=      "</Responses>"
    xml +=    "</RequestApplication>"
    xml
  end

end
