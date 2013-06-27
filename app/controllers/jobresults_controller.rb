require "httparty"

class JobresultsController < ApplicationController
  include HTTParty
  base_uri "http://api.careerbuilder.com"

    def index
      if !params[:kw].blank? && !params[:loc].blank?

        @jobresults = jobsearch(:keywords => params[:kw],:Location => params[:loc])

      elsif  !params[:kw].blank? && params[:loc].blank?

        @jobresults = jobsearch(:keywords => params[:kw] )

      elsif  params[:kw].blank? && !params[:loc].blank?

        @jobresults = jobsearch(:Location => params[:loc])

      else

        @jobresults = jobsearch(:keywords => "")

      end
  end

end
