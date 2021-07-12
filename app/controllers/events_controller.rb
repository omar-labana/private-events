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
    # but they already exist for each user?
    @past_events = previous_events
    @upcoming_events = upcoming_events
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.creator_id)
    @attendees = @event.attendees
    @attending = @attendees.where(id: current_user.id).any?
    @owner = @event.creator == current_user
    @attendance = @event.attendances.find_by(user_id: current_user.id)
  end

  def edit
    @event = Event.find(params[:id]) if Event.find(params[:id]).creator == current_user
    @invited = @event.attendees
    @uninvited = User.where.not(id: @event.attendees.select(&:id)).where.not(id: @event.creator_id)
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      @invited = @event.attendees
      @uninvited = User.where.not(id: @event.attendees.select(&:id)).where.not(id: @event.creator_id)
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end

  def previous_events
    Event.where('date < ?', Time.now)
  end

  def upcoming_events
    Event.where('date >= ?', Time.now)
  end
end
