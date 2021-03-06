class TicketsController < ApplicationController
  before_action :authenticate_user! #, only: [:create, :destroy]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = current_user.tickets.all
  end

  def show
    current_user.tickets.find(@ticket.id)
  end

  def new
    @ticket = current_user.tickets.new
    @train_id = params[:train_id]
    @station_first = params[:start_station_id]
    @station_last = params[:end_station_id]
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    current_user.tickets.find(@ticket.id).destroy
    redirect_to tickets_path
  end

  private

  #Находит объект в бд
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :full_name, :passport)
  end
end