class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @past_attended_events = @user.attended_events.past
    @upcoming_attended_events = @user.attended_events.upcoming
    @past_owned_events = @user.events.past
    @upcoming_owned_events = @user.events.upcoming
  end
end
