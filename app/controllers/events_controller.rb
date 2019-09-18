class EventsController < ApplicationController
   before_action :authenticate_user! ,only: [:new, :create]	

  def index
    @events = Event.page(params[:page]).per(20)
  end

  def show 
    @event = Event.find(params[:id])
<<<<<<< HEAD
    @participants = User.where(id: @event.users)
    @user_event = UserEvent.find_by(event_id: @event.id, user_id: current_user.id)
=======
    @participants = User.where(id: @event.users) 
>>>>>>> d223c1ed20a8f19b26c94a4f7ed05d044f03c7d0
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
