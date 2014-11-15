class SessionsController < ApplicationController
  layout 'auth_things', only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user

      # http://stackoverflow.com/questions/26538891/flash-message-with-html-safe-from-the-controller-in-rails-4
      redirect_back_or user, success: %Q[ Welcome, #{user.profile ? user.profile.name : view_context.link_to('Complete your profile', new_user_profile_path(user), class: 'alert-link')} ], flash: { html_safe: true }
    else
      flash.now[:danger] = 'Invalid E-mail or password.'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url,
      success: "Log out successfully."
  end
end