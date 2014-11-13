class SessionsController < ApplicationController
  layout 'auth_things', only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user

      # http://stackoverflow.com/questions/26538891/flash-message-with-html-safe-from-the-controller-in-rails-4
      redirect_back_or user, success: %Q[ 歡迎，#{view_context.link_to('填寫個人資料', new_user_profile_path(user))} ], flash: { html_safe: true }
    else
      flash.now[:danger] = '無效的E-mail 或密碼'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url,
      success: "您已經登出！"
  end
end