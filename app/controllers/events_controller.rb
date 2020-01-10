class EventsController < ApplicationController
   before_action :authenticate_user! ,only: [:new, :create]

  def index
    @q = Event.where('started_at > ?', Date.today).ransack(params[:q])
    @events = @q.result.published.order(:started_at).page(params[:page]).per(20)
  end

  def show
    @user = current_user
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
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @event = Event.new(event_params)
    categories = Category.where(params[:category_ids])
    if @event.save
      categories.each do |c|
        @event.add_category(c)
      end
      redirect_to @event
    else
      render :new
    end
  end



  def search
    @q = Event.where('started_at > ?', Date.today).ransack(params[:q])
    @events = @q.result.order(:started_at).page(params[:page]).per(20)
  end

  private
    def event_params
      params.require(:event).permit(:title, :location,:description, :started_at, :ended_at)
    end
end
