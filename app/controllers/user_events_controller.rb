class UserEventsController < ApplicationController 
   before_action :authenticate_user! ,only: [:delete, :create]
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @user.user_events.create(event_id: @event.id)
    redirect_to event_path(@event)
  end 

  def delete
    @user = current_user
    @event = Event.find(params[:id])
    @user_event = @user.user_events.find(event_id: @event.id)
    @user_event.destroy
    redirect_to events_path
  end 


end
