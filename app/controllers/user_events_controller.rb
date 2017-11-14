class UserEventsController < ApplicationController

  def create
    # NEED TO ADD SO THAT A PERSON CAN'T BE IN AN EVENT TWICE
    # existing_user_events = UserEvent.all
    # existing_user_events.each do |user_event|
    #   if user_event.user_id == current_user.id
    #     flash[:warning] = "You have already joined"
    #   end

    user_event = UserEvent.create(
      event_id: params[:id],
      user_id: current_user.id
    ) 
    redirect_to "/events/#{user_event.event_id}"
  end

  def destroy
    user_event = UserEvent.find_by(id: params[:user_event_id])
    user_event.destroy
    flash[:success] = "You have successfully unjoined event."
    redirect_to "/events/#{user_event.event_id}"
  end

end
