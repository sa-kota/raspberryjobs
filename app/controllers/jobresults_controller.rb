
class JobresultsController < ApplicationController

    def index
      apiservice = ApiService.new()

      if !params[:kw].blank? && !params[:loc].blank?
        @jobresults = apiservice.jobsearch(:keywords => params[:kw],:Location => params[:loc])
      elsif  !params[:kw].blank? && params[:loc].blank?
        @jobresults = apiservice.jobsearch(:keywords => params[:kw] )
      elsif  params[:kw].blank? && !params[:loc].blank?
        @jobresults = apiservice.jobsearch(:Location => params[:loc])
      else
        @jobresults = apiservice.jobsearch(:keywords => "")
      end
  end

end
