class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(20)
  end

  def show 
  end

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
    @event.publih_flg = false
    if @event.save
      redirect_to @event 
    else 
      render :new
    end
  end 

  private
    def event_params 
      params.require(:event).permit(:title, :detail, :publish_start_at, :publish_start_end) 
    end 
end
