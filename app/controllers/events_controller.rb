class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(20)
  end

  def show

  end
end
