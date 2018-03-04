class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_logged_in, except: [:new, :create]

  before_action :check_user_id, except: [:new, :create]


  def check_user_id

    @user = User.find params[:id]
    unless @current_user == @user
      flash[:error] = "You must be logged in to view this page."
      redirect_to @current_user
    end

  end


  def show
    @user = User.find params[:id]
  end


  def new
    @user = User.new
  end


  def edit
    @user = User.find params[:id]
  end


  def create

    user = User.create user_params

    if user.persisted?
    # did user get saved? is the user present now?
      session[:user_id] = user.id
      redirect_to games_path
      # will take you to the show page
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end


  def update
    @user = User.find params[:id]
    User.update user_params
    redirect_to @current_user
  end


  def destroy
    User.destroy params[:id]
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon)
    end
end
