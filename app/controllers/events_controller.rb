class EventsController < ApplicationController
   before_action :authenticate_user! ,only: [:new, :create]	

  def index
    @events = Event.page(params[:page]).per(20)
  end

  def show 
    @event = Event.find(params[:id])
    @participants = User.where(id: @event.users)
    @user_event = UserEvent.find_by(event_id: @event.id, user_id: current_user.id)
  end

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
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
