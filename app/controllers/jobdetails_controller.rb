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

  def applyfinish
    xml_resp = build_xml(params)
    @result = ApplyForAJob(xml_resp)
  end

  def build_xml(options)
    xml =     "<RequestApplication>"
    xml +=       "<DeveloperKey>WDHL2LS5XZF8GYFHK1SB</DeveloperKey>"
    xml +=       "<JobDID>#{options[:jobdid]}</JobDID>"
    xml +=       "<Test>true</Test>"
    xml +=       "<SiteID />"
    xml +=       "<CoBrand />"
    xml +=       "<Responses>"
    xml +=         "<Response>"
    xml +=          "<QuestionID>ApplicantName</QuestionID>"
    xml +=          "<ResponseText>#{options[:name]}</ResponseText>"
    xml +=        "</Response>"
    xml +=         "<Response>"
    xml +=           "<QuestionID>ApplicantEmail</QuestionID>"
    xml +=           "<ResponseText>#{options[:mail]}</ResponseText>"
    xml +=        "</Response>"
    xml +=        "<Response>"
    xml +=          "<QuestionID>Resume</QuestionID>"
    xml +=          "<ResponseText>#{options[:resume]}</ResponseText>"
    xml +=        "</Response>"
    xml +=        "<Response>"
    xml +=          "<QuestionID>CoverLetter</QuestionID>"
    xml +=          "<ResponseText>#{options[:coverLetter]}</ResponseText>"
    xml +=        "</Response>"
    xml +=        "<Response>"
    xml +=          "<QuestionID>MeetsRequirements</QuestionID>"
    xml +=          "<ResponseText>Yes</ResponseText>"
    xml +=        "</Response>"
    xml +=      "</Responses>"
    xml +=    "</RequestApplication>"
    xml
  end

end
