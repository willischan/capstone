class UsersController < ApplicationController
  def index

  end 

  def new

  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      phone_number: params[:phone_number],
      favorite: params[:favorite],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      # longitude: coordinates[0],
      # latitude: coordinates[1]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/users/new'
    end
  end

  def show
    if current_user.present?
      @user = User.find(params[:id])

      render :show
    else
      redirect_to '/'
    end
  end

  def edit
    if current_user == User.find(params[:id])
      @user = User.find(params[:id])
    else
      flash[:warning] = "You are not authorized"
      redirect_to "/users/#{@current_user.id}/edit"
    end
  end

  def update
    coordinates = Geocoder.coordinates(params[:address])
    if current_user == User.find(params[:id])
      @user = User.find_by(id: params[:id])
      @user.first_name = params[:first_name]
      @user.last_name = params[:last_name]
      @user.email = params[:email]
      @user.address = params[:address]
      @user.city = params[:city]
      @user.state = params[:state]
      @user.zip_code = params[:zip_code]
      @user.phone_number = params[:phone_number]
      @user.favorite = params[:favorite]

      # @user.longitude = coordinates[0]
      # @user.latitude = coordinates[1]
      if @user.save
        flash[:success] = "Profile successfully updated"
        redirect_to "/users/#{@user.id}"
      else
        render :edit
      end
    else
      flash[:warning] = "You are not authorized"
      redirect_to "/users/#{@user.id}"
    end
  end

  def destroy

  end
end
