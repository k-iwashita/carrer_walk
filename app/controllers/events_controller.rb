class EventsController < ApplicationController
   before_action :authenticate_user! ,only: [:new, :create]

   before_action :set_event, only: [:toggle_status]


  def index
    @q = Event.where('started_at > ?', Date.today).ransack(params[:q])
    @events = @q.result.published.order(:started_at).page(params[:page]).per(20)
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
    @event = Event.new(status: :"published")
    @event = Event.new(event_params)

    if @event.save

      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "更新しました"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def search
    @q = Event.where('started_at > ?', Date.today).ransack(params[:q])
    @events = @q.result.order(:started_at).page(params[:page]).per(20)
  end

  def confirm
    @events = Event.draft.order("created_at DESC")
  end

  def toggle_status
    @event.toggle_status!
    redirect_to @event, notice: '公開しました'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to confirm_events_path
    flash[:info] = "削除しました"

  end


  private
    def event_params
      params.require(:event).permit(:title, :location,:description, :started_at, :ended_at,:status)
    end

    def set_event
      @event = Event.find(params[:id] || params[:event_id])
    end


end
