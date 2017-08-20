class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy, :update_position]
  before_action :set_train, only: [:new, :create]
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

  def update
    respond_to do |format|
      if @wagon.update(wagon_params)
        format.html { redirect_to @wagon, notice: 'Wagon was successfully updated.' }
        format.json { render :show, status: :ok, location: @wagon }
      else
        format.html { render :edit }
        format.json { render json: @wagon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wagon.destroy
    respond_to do |format|
      format.html { redirect_to train_path(@wagon.train), notice: 'Wagon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:train_id, :type, :up_seats, :down_seats, :number)
  end
end