class UserEventsController < ApplicationController
   before_action :authenticate_user! ,only: [:delete, :create]
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @user.user_events.create(event_id: @event.id)
    redirect_to event_path(@event)
  end

  def destroy
    @user_event = UserEvent.find(params[:id])
    @event = Event.find_by(id: @user_event.event_id)
    @user_event.destroy
    redirect_to event_path(@event)
  end

end
