class UserEventsController < ApplicationController

  def create
    # existing_user_events = UserEvent.all
    # existing_user_events.each do |user_event|
    #   if user_event.user_id == current_user.id
    #     flash[:warning] = "You have already joined"
    #   end

    user_event = UserEvent.create(
      event_id: params[:restaurant_id],
      user_id: current_user.id
    )
    flash[:success] = "You have successfully joined event" 
    redirect_to "/events/#{user_event.event_id}"
  end

end
