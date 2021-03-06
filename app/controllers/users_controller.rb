class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
 before_action :correct_user, only: [:edit, :update]
 before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
 before_action :admin_or_correct_user, only: :show
 before_action :set_one_month, only: :show

  require 'csv'
  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
      if current_user.admin?
      else
        redirect_to(root_path) 
        flash[:warning] = "ほかのユーザにはアクセスできません"
      end
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update_by_admin
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end  

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def working_users
    @users = User.get_working_user.paginate(page: params[:page])
  end  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation, :basic_time, :employee_number, :uid, :designated_work_start_time, :designated_work_end_time)
    end

    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)

    end
end