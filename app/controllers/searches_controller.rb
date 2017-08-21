class SearchesController < ApplicationController

  def index
  end

  def show
    @routes = Route.search(params[:station_first], params[:station_last])
  end
end