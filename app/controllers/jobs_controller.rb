class JobsController < ApplicationController

  def jobrec
    apiservice = ApiService.new()
     @jobrecs = apiservice.LoadRecommendations(:JobDID => params[:jobdid])
  end

end
