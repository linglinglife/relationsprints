class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :fetch_user

  def check_if_logged_in
    if @current_user.nil?
      flash[:error] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end


  private

  def fetch_user

    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end

    session[:user_id] = nil unless @current_user.present?
  end


end
