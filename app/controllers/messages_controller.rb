class MessagesController < ApplicationController

  def index

  end 

  def new

  end

  def create
    message = Message.new(
      event_id: params[:event_id],
      user_id: params[:user_id],
      content: params[:content],
    )
    if message.save
      flash[:success] = 'Successfully posted message!'
      redirect_to "/events/#{message.event_id}"
    else
      flash[:warning] = 'Message could not be posted'
      redirect_to "/events/#{message.event_id}"
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
