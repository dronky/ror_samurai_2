class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
    @train_id = params[:train_id]
    @user_id = params[:user_id]
    @station_first = params[:start_station_id]
    @station_last = params[:end_station_id]
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save!
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to ticket_path
  end

  private

  #Находит объект в бд
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :user_id, :start_station_id, :end_station_id, :full_name, :passport)
  end
end