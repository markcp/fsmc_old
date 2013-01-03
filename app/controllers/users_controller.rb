class UsersController < ApplicationController
  before_filter :correct_signed_in_user, only: [ :show ]
  before_filter :admin_user, only: [ :new ]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Success!"
      redirect_to new_user_path
    else
      render 'new'
    end
  end

  # private

  #   def correct_signed_in_user
  #     @user = User.find(params[:id])
  #     redirect_to signin_url, notice: "Please sign in." unless signed_in? && current_user?(@user)
  #   end

  #   def admin_user
  #     redirect_to signin_url, notice: "Please sign in." unless signed_in? && current_user.admin?
  #   end
end
