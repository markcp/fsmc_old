class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.first
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path, notice: "Signed in!"
    else
      flash.now[:error] = 'Invalid password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
