class EventsController < ApplicationController
  def index
    @events = Event.all
  end 

  def new

  end

  def create
    event = Event.new(
      user_id: current_user.id,
      event_name: params[:event_name],
      description: params[:description],
      event_date: params[:event_date],
      event_time: params[:event_time],
      restaurant_id: Restaurant.find_by(restaurant_name: params[:restaurant_name]).id
    )
    if event.save
      flash[:success] = "Event successfully created" 
      redirect_to "/events/#{event.id}"
    else
      p event.errors.full_messages
      flash[:warning] = "Event unsuccessfully created. Try Again." 
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit 
    if current_user.id == Event.find(params[:id]).user_id
      @event = Event.find(params[:id])
    else
      flash[:warning] = "You are not authorized"
      redirect_to "/"
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.event_name = params[:event_name]
    @event.description = params[:description]
    @event.event_date = params[:event_date]
    @event.event_time = params[:event_time]
    @event.restaurant_id = Restaurant.find_by(restaurant_name: params[:restaurant_name]).id
    if @event.save
      flash[:success] = "Event successfully updated"
      redirect_to "/events/#{@event.id}"
    else
      render :edit
    end
  end

  def destroy

  end

end