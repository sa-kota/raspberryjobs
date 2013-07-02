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
    @result = ApplyForAJob()
  end

  def external_request_builder()
    xml = "<Request>"
    #xml += "<DeveloperKey>WDHD88S735S3V2NWZKPD</DeveloperKey>"
    xml += "<DeveloperKey>WDHL2LS5XZF8GYFHK1SB</DeveloperKey>"
    xml += "<EmailAddress>sandy@ror.com</EmailAddress>"
    xml += "<JobDID>J3F4X06G4W0CQK1HD72</JobDID>"
    xml += "<SiteID>cbnv</SiteID>"
    xml += "<IPath>raspberry</IPath>"
    xml += "<IsExternalLinkApply>false</IsExternalLinkApply>"
    xml += "<HostSite>US</HostSite>"
    xml += "</Request>"
    xml
  end


end
