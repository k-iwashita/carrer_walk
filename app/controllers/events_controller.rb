class EventsController < ApplicationController
   before_action :authenticate_user! ,only: [:new, :create]

  def index
    @events = Event.published.where('started_at > ?', Date.today).order(:started_at).page(params[:page]).per(20)
  end

  def show
    @event = Event.find(params[:id])
    @participants = User.where(id: @event.users)
    @user_event = UserEvent.find_by(event_id: @event.id, user_id: current_user.id) if current_user
    @participants = User.where(id: @event.users)

    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.lat
      marker.lng event.lon
      marker.infowindow event.location
    end
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
