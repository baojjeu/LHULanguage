class ProfilesController < ApplicationController

  before_action :set_user
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :finish_profile?, only: :new

  def show
    redirect_to new_user_profile(@user) if @profile.nil?
  end

  def new
    @profile = @user.build_profile
  end

  def edit
  end

  def create
    @profile = @user.create_profile(profile_params)
    if @profile.save
      redirect_to user_profile_path(@user)
    end
  end

  def update
    if @user.profile.update(profile_params)
      redirect_to user_profile_path(@user)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = @user.profile
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :nickname, :gender, :description)
    end

    def finish_profile?
      unless @user.profile.nil?
        redirect_to user_profile_url(@user),
          warning: '你已經填寫完成了'
      end
    end
end
