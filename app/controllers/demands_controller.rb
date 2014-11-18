class DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :apply, :allow, :apply_form, :determine]
  before_action :redirect_if_non_logged_in, only: [:new, :edit, :create, :update, :apply, :apply_form, :determine]
  before_action :check_is_author, only: :apply_form

  def index
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @demands = @user.present? ? @user.demands : Demand.all
  end

  def show
  end

  def new
    @demand = current_user.demands.new
  end

  def edit
  end

  def create
    @demand = current_user.demands.new(demand_params)

    respond_to do |format|
      if @demand.save
        format.html { redirect_to @demand, success: '學習需求建立成功！' }
        format.json { render :show, status: :created, location: @demand }
      else
        format.html { render :new }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @demand.update(demand_params)
        format.html { redirect_to @demand, success: '學習需求修改成功！' }
        format.json { render :show, status: :ok, location: @demand }
      else
        format.html { render :edit }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to demands_url, success: '學習需求刪除成功！' }
      format.json { head :no_content }
    end
  end

  def apply_form
    @demand_application = current_user.demand_applications.new
  end

  def apply
    @demand_application = current_user.demand_applications.new(demand_application_params)
    @demand_application.demand = @demand
    if @demand_application.save
      Notification.send_notification_with(current_user, @demand)
      redirect_to @demand
    else
      render :apply_form
    end
  end

  def allow
    if current_user.is_author_of?(@demand)
      @demand.update(instrustor_params)
      redirect_to current_user
    end
  end

  def determine

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_params
      params.require(:demand).permit(:description, { arrangement_ids: [] }, :language_id)
    end

    def instrustor_params
      params.require(:demand).permit(:instructor_id)
    end

    def demand_application_params
      params.require(:demand_user).permit(:info)
    end

    def redirect_if_non_logged_in
      unless logged_in?
        store_location
        flash.now[:danger] = "請先登入"
        redirect_to login_url
      end
    end

    def check_is_author
      if current_user.already_apply_for?(@demand) || current_user.is_author_of?(@demand)
        redirect_to root_url,
          danger: 'Invalid action'
      end
    end
end
