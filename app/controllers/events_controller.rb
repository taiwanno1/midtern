class EventsController < ApplicationController

  before_action :find_event, :only => [:update, :destroy]

  def index
    @events = Event.all

    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      @event = Event.new
    end

    @events = @events.page(params[:page]).per(5)
  end

  def create
  end

  def update
  end

  def destroy
  end



private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:topic, :articel, :cat_id)
  end

end
