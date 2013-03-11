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
end
