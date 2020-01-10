# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.where(id: @user.events)
    @id = @user.id
  end

  def portfolio
    @user = User.find(params[:id])
    @events = Event.where(id: @user.events)
  end

  def joiningEvent
    @user = User.find(params[:id])
    @events = Event.where(id: @user.events)
  end



end
