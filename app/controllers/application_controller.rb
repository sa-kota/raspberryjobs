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

  def ApplyForAJob(options)
    mashup(self.class.post('/v1/application/submit?', :body => options, :headers => {'Content-type' => 'text/xml'}))
  end

  def LoadQuestionForJob(options={})
    mashup(self.class.get("/v1/application/blank?",:query => options.merge(self.default_options)))
  end

end
