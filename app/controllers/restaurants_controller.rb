class RestaurantsController < ApplicationController

  def index

  end 

  def new

  end

  def create
    restaurant = Restaurant.new(
      restaurant_name: params[:restaurant_name],
      address: params[:address],
      yelp_url: params[:yelp_url],
    )
    if restaurant.save
      flash[:success] = "Event successfully created" 
      redirect_to "/events"
    else
      p restaurant.errors.full_messages
      flash[:warning] = "Event unsuccessfully created. Try Again." 
      render :new
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
