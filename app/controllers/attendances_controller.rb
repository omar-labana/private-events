class AttendancesController < ApplicationController
  def destroy
    Attendance.find_by(user_id: params[:user_id], event_id: params[:event_id]).delete
    redirect_to edit_event_path(Event.find(params[:event_id]))
  end

  def destroy_from_attendee
    Attendance.find_by(user_id: params[:user_id], event_id: params[:event_id]).delete
    redirect_to event_path(Event.find(params[:event_id]))
  end

  def create
    Attendance.create(user_id: params[:user_id], event_id: params[:event_id])
    redirect_to edit_event_path(Event.find(params[:event_id]))
  end
end
