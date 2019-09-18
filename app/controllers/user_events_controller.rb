class UserEventsController < ApplicationController 
   before_action :authenticate_user! ,only: [:delete, :create]
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @user.user_events.create(event_id: @event.id)
    redirect_to event_path(@event)
  end 

<<<<<<< HEAD
  def destroy
    @user_event = UserEvent.find(params[:id])
    @event = Event.find_by(id: @user_event.event_id)
    @user_event.destroy
    redirect_to event_path(@event)
  
=======
  def delete
    @user = current_user
    @event = Event.find(params[:id])
    @user_event = @user.user_events.find(event_id: @event.id)
    @user_event.destroy
    redirect_to events_path
>>>>>>> d223c1ed20a8f19b26c94a4f7ed05d044f03c7d0
  end 


end
