class UsersController < ApplicationController
  def index

  end 

  def new

  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      address: params[:address],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
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
    if current_user == User.find(params[:id])
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
    if current_user == User.find(params[:id])
      @user = User.find_by(id: params[:id])
      @user.first_name = params[:first_name]
      @user.last_name = params[:last_name]
      @user.email = params[:email]
      @user.address = params[:address]
      @user.phone_number = params[:phone_number]
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
