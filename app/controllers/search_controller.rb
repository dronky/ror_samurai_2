class SearchController < ApplicationController
  before_action :set_search, only: [:show]

  def index
    @search = Search.all
  end

  def show
  end

  private

  def set_search
    @routes = Route.search(params[:station_first], params[:station_last])
  end

end
