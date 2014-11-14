class DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :apply, :cancel_apply, :allow, :apply_form]
  before_action :redirect_if_non_logged_in, only: [:new, :edit, :create, :update, :apply, :apply_form]

  # GET /demands
  # GET /demands.json
  def index
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @demands = @user.present? ? @user.demands : Demand.all
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
  end

  # GET /demands/new
  def new
    @demand = current_user.demands.new
  end

  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
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

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
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

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to demands_url, success: '學習需求刪除成功！' }
      format.json { head :no_content }
    end
  end

  def apply_form
    if current_user.is_author_of?(@demand)
      redirect_to root_url,
        danger: '自己不能應徵自己的學習需求'
    end
  end

  def apply
    if current_user.already_apply_for?(@demand) || current_user.is_author_of?(@demand)
      flash[:warning] = "Invalid action"
    else
      current_user.apply!(@demand)
      Notification.send_notification_with(current_user, @demand)
    end
    redirect_to @demand
  end

  def cancel_apply
    if current_user.already_apply_for?(@demand)
      current_user.cancel_apply!(@demand)
    else
      flash.now[:warning] = "無效的操作"
    end
    redirect_to @demand
  end

  def allow
    if current_user.is_author_of?(@demand)
      @demand.update(instructor_param)
      redirect_to current_user
    end
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

    def instructor_param
      params.require(:demand).permit(:instructor_id)
    end

    def redirect_if_non_logged_in
      unless logged_in?
        store_location
        flash.now[:danger] = "請先登入"
        redirect_to login_url
      end
    end
end
