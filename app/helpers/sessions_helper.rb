module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    cookies.delete(:remember_token)
  end

  def signed_in?
    if cookies[:remember_token] = User.first.remember_token
    end
  end
end
