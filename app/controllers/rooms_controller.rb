class RoomsController < ApplicationController
    before_action :authenticate_user!
  def index
    @rooms = Room.all
  end


  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
  end

  def detail
    @room =Room.find(params[:id])

  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save
      current_user.user_rooms.create(room_id: @room.id)
    redirect_to @room

  end



  private
  def room_params
    params.require(:room).permit(:name,:user_id)
  end

end
