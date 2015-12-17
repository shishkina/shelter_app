class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new,:create]

def new
  @user = User.new
end

def index
  if logged_in? && current_user.admin==true
  @users = User.all
  end
end

def show
  if logged_in?
  @user = User.find(session[:user_id])
  @animal = Animal.new
  @animal.user_id = @user.id
  else
    redirect_to login_path
  end
end

def create
  @user = User.new user_params
  if @user.save
     session[:current_user_id] = @user.id
    flash[:success] = "Welcome to THE SHELTER"
    redirect_to @user
  else
    render new_user_path
  end
end
def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path
end

def destroy
  @user = User.find params[:id]
  @user.destroy
  redirect_to user_path
end

private

def user_params
  params.require(:user).permit(:name, :phone, :admin, :email, :password, :password_confirmation)
end
end
