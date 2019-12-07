class EventsController < ApplicationController
  before_action :set_event, only: [:destroy, :edit, :update]
  before_action :set_color, only: [:new, :edit]

  def index
    @events = Event.all.order("created_at DESC")
    @job_events = @events.where(color_id: 1)
    @play_events = @events.where(color_id: 2)
    @todo_events = @events.where(color_id: 3)
    @other_events = @events.where(color_id: 4)
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    redirect_to events_path if @event.destroy
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def set_color
    @colors = Color.order("id ASC")
  end
  
  def event_params
    params.require(:event).permit(:title, :start, :end, :color_id)
  end
end
