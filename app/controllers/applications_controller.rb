class ApplicationsController < ApplicationController

  def index
  end

  def show
    @firstname = params[:fn]
    @lastname = params['ln']
  end

  def new
  end

end
