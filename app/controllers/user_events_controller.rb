class UserEventsController < ApplicationController
   before_action :authenticate_user! ,only: [:delete, :create]
  def create
    user = current_user
    event = Event.find(params[:event_id])
    user.event_join(event)
    redirect_to event_path(event)
  end

  def destroy
    user = current_user
    event = Event.find_by(params[:event_id])
    user.event_unjoin(event)
    redirect_to event_path(event)
  end

end
