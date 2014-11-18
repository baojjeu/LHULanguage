class NotificationsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.js { @notifications = @user.notifications }
    end
  end
end