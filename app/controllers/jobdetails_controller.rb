
class JobdetailsController < ApplicationController

  def index
  end

  def show
    apiservice = ApiService.new()
    @jobdetail = apiservice.jobdetail(:DID => params[:jobDID])
  end

  def apply
    apiservice = ApiService.new()
    @Questions = apiservice.LoadQuestionForJob(:JobDID => params[:jobDID])
  end

  def external_apply
    xml_resp = build_external_xml(params)
    apiservice = ApiService.new()
    @result = apiservice.ExternalApplyForJob(xml_resp)
  end

  def build_external_xml(options)
    xml = "<Request>"
    xml += "<DeveloperKey>#{DEVELOPERKEY}</DeveloperKey>"
    xml += "<EmailAddress>#{options[:email]}</EmailAddress>"
    xml += "<JobDID>#{options[:jobdid]}</JobDID>"
    xml += "<IsExternalLinkApply>true</IsExternalLinkApply>"
    xml += "<HostSite>US</HostSite>"
    xml += "</Request>"
  end

  def applyfinish
    xml_resp = build_xml(params)
    apiservice = ApiService.new()
    @result = apiservice.ApplyForAJob(xml_resp)
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
