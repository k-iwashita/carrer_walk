class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.where(id: @user.events)
  end

  def portfolio
    @user = User.find(params[:id])
    @events = Event.where(id: @user.events)
  end



end
