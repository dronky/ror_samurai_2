class WagonsController < ApplicationController
  before_action :set_train
  def index
    @wagons = Wagon.all
  end

  def new
    @wagon = Wagon.new
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    if @wagon.save!
      redirect_to @train
    else
      render :new
    end
  end

  def show
    @wagon = Wagon.find(params[:id])
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:train_id, :wagon_type, :up_seats, :down_seats, :number)
  end
end