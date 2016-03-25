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
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to events_path
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path(:page => params[:page])
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path(:page => params[:page])
  end



private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:topic, :article, :cat_id)
  end

end
