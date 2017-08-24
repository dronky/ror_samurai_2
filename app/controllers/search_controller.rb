class SearchController < ApplicationController
  before_action :set_search_result, only: [:show]

  def index
  end

  def show
    @start_station = params[:station_first]["id"]
    @end_station = params[:station_last]["id"]
  end

  private

  def set_search_result
    @routes = Route.search(params[:station_first], params[:station_last])
  end

end
