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
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @user_id = params[:ticket][:user_id]
    @ticket.full_name = @ticket.get_user_name(@user_id.to_i)
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
    redirect_to tickets_path
  end

  private

  #Находит объект в бд
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :user_id, :start_station_id, :end_station_id)
  end
end