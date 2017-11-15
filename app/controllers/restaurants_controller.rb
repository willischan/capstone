class RestaurantsController < ApplicationController

  def index
    @keyword = params[:keyword]
    @location = params[:location]
    @restaurants = Unirest.get("https://api.yelp.com/v3/businesses/search", headers:{"Authorization"=>"Bearer dafqWrvRw4VPCWPLrgvt3mOoO8Wdsa1qVmSe1kTdDuAEIak0TGpKv4ZIEBiuvpIivt616t_iyCLCtb5wJth_BB9EVHjfw-uvhx_rwL2gsyY30lo6uLTHdg-YlT4BWnYx"}, parameters:{:term=>@keyword,:location=>@location}).body
  end 

  def new
    @restaurant = Unirest.get("https://api.yelp.com/v3/businesses/#{params[:yelp_id]}", headers:{"Authorization"=>"Bearer dafqWrvRw4VPCWPLrgvt3mOoO8Wdsa1qVmSe1kTdDuAEIak0TGpKv4ZIEBiuvpIivt616t_iyCLCtb5wJth_BB9EVHjfw-uvhx_rwL2gsyY30lo6uLTHdg-YlT4BWnYx"}).body
  end

  def create
    restaurant = Restaurant.new(
      restaurant_name: params[:restaurant_name],
      address: params[:address],
      yelp_url: params[:yelp_url],
      img_url: params[:img_url],
      latitude: params[:latitude],
      longitude: params[:longitude]
    )
    if Restaurant.exists?(restaurant_name: params[:restaurant_name])  
      flash[:warning] = "Restaurant already exists." 
      redirect_to "/events/new"
    elsif restaurant.save
      flash[:success] = "Restaurant successfully created" 
      redirect_to "/events/new"
    else
      p restaurant.errors.full_messages
      flash[:warning] = "Restaurant unsuccessfully created. Try Again." 
      redirect_to "/events/new"
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
