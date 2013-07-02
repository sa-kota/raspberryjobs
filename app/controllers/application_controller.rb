class ApplicationController < ActionController::Base
  protect_from_forgery

  def default_options
    {:DeveloperKey => "WDHL2LS5XZF8GYFHK1SB"}
  end

  def mashup(response)
    puts response.inspect
    case response.code
      when 200
        if response.is_a?(Hash)
          Hashie::Mash.new(response)
        else
          if response.first.is_a?(Hash)
            response.map{|item| Hashie::Mash.new(item)}
          else
            response
          end
        end
    end
  end

  def jobsearch(options={})
    mashup(self.class.get("/v1/jobsearch?", :query => options.merge(self.default_options)))
  end

  def jobdetail(options={})
    mashup(self.class.get("/v1/job?",:query => options.merge(self.default_options)))
  end

  def LoadApplicationForm(options={})
    self.class.get("/v1/application/form?",:query => options.merge(self.default_options))
  end

  def LoadRecommendations(options={})
    mashup(self.class.get("/v1/recommendations/forjob?",:query => options.merge(self.default_options)))
  end

  def ApplyForAJob(options={})
    self.class.post('/v1/application/form?', :body => internal_request_builder(), :headers => {'Content-type' => 'text/xml'})
  end


  def internal_request_builder()
    xml =   "<Request>"
    xml +=     "<RequestApplication>"
    xml +=       "<DeveloperKey>WDHL2LS5XZF8GYFHK1SB</DeveloperKey>"
    xml +=       "<JobDID>J3F4X06G4W0CQK1HD72</JobDID>"
    xml +=       "<Test>false</Test>"
    xml +=       "<SiteID />"
    xml +=       "<CoBrand />"
    xml +=       "<Responses>"
    xml +=         "<Response>"
    xml +=          "<QuestionID>ApplicantName</QuestionID>"
    xml +=          "<ResponseText>Sandesh Kota</ResponseText>"
    xml +=        "</Response>"
    xml +=         "<Response>"
    xml +=           "<QuestionID>ApplicantEmail</QuestionID>"
    xml +=           "<ResponseText>sandy@ror.com</ResponseText>"
    xml +=        "</Response>"
    xml +=        "<Response>"
    xml +=          "<QuestionID>Resume</QuestionID>"
    xml +=          "<ResponseText>Sandesh kota, Senior Engineer</ResponseText>"
    xml +=        "</Response>"
    xml +=      "</Responses>"
    xml +=    "</RequestApplication>"
    xml =   "<Request>"
    xml
  end

end
