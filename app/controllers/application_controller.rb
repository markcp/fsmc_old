class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  private
    def current_user
      @current_user ||= User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token]
    end
    helper_method :current_user

    def current_year
      @current_year ||= Year.last
    end
    helper_method :current_year

    def correct_signed_in_user
      @user = User.find(params[:id])
      redirect_to signin_url, notice: "Please sign in." unless signed_in? && current_user?(@user)
    end

    def admin_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in? && current_user.admin?
    end
end
