module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def redirect_back_or(default, options = {})
    # http://archives.ryandaigle.com/articles/2009/12/20/what-s-new-in-edge-rails-set-flash-in-redirect_to
    redirect_to(session[:forwarding_url] || default, options)
    session.delete(:forwarding_url)
  end
end
