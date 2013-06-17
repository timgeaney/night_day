class EventsController < ApplicationController
  def new
  end
  def index
    @event = Event.new(params[:event])
  end
end
