class EventAttendancesController < ApplicationController

  def create
    @attende = User.find_by(username: params[:user_username])

    if @attende
      
      begin 
        EventAttendance.create!(attended_event_id: params[:event_id], attendees_id: @attende.id)
        flash[:notice] = "User has been invited succefully"
        redirect_to event_path(params[:event_id])
      rescue ActiveRecord::RecordNotUnique
        flash[:alert] = "User already is invited"
        redirect_to event_path(params[:event_id])
      end

    else
      flash[:alert] = "This user doesn't exist."
      redirect_to event_path(@event)
    end

  end

  def update
    @event_attendance = EventAttendance.find(params[:id])

    if @event_attendance.update(confirmation: true)
      flash[:notice] = "The invitation has been accepted"
      redirect_to event_path(@event_attendance.attended_event_id)
    else
      flash[:alert] = "Something went wrong"
    end

  end

  def destroy
    @event_attendance = EventAttendance.find(params[:id])
    
    @event_attendance.destroy
    flash[:notice] = "You have declined the invitation."
    redirect_to user_path(@event_attendance.attendees_id)

  end

end
