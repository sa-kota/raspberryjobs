class ApplicationController < ActionController::Base
  protect_from_forgery

  def default_options
    {:DeveloperKey => "WDHL2LS5XZF8GYFHK1SB"}
  end

  def jobsearch(options={})
    self.class.get("http://api.careerbuilder.com/v1/jobsearch?", :query => options.merge(self.default_options))
  end

  def jobdetail(options={})
    self.class.get("http://api.careerbuilder.com/v1/job?",:query => options.merge(self.default_options))
  end

end
