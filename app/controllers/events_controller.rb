class EventsController < ApplicationController
  before_action :require_login, except: [:index]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event was successfully created"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date, :location )
  end

end
