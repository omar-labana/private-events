class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = Event.all.order(:date)
    @users = User.all
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.creator_id)
    
  end

  def edit
    
  end

  def update
    @event = Event.find(params[:id])
   
  end

  def destroy
    Event.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :location)
  end
end
