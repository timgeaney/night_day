class EventsController < ApplicationController
  def new
  	@event = Event.new(params[:event])

  end

  def index
    @events = Event.paginate(page: params[:page])
  end

  def create
    @event = current_user.events.build(params[:event])

    if @event.save
    	flash[:notice] = "Success"
    	redirect_to @event
    else
    	flash[:notice] = "Failed to save"
    	render 'new'
    end
  end

  def show
  	@event = Event.find(params[:id])
  end
end
