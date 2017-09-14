class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
    # @station_first = params[:station_first]
    # @station_last = params[:station_last]
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @start_station = params[:route][:station_first].to_i
    @end_station = params[:route][:station_last].to_i
    @route = Route.new(station_first: RailwayStation.find(@start_station), station_last: RailwayStation.find(@end_station))
    # @route.add_stations(@start_station, @end_station)
    @route.railway_station_ids = [@start_station, @end_station]
    if @route.save!
      redirect_to admin_route_path(@route)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to admin_routes_path
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  private

  #Находит объект в бд
  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit!
  end
end
