class PointsController < ApplicationController
  
  def index
    @points = Point.all
  end  
  
  def show
    @point = Point.find(params[:id])
  end
  
  def new
    @point = Point.new
  end 
  
  def create
    @point = Point.new(points_params)
    if @point.save
      flash[:success] = '拠点情報を追加しました。'
    else
      flash[:danger] = "拠点情報の追加は失敗しました。<br>" + @point.errors.full_messages.join("<br>")
    end
      redirect_to points_path
  end  
  
  def edit
    @point = Point.find(params[:id])
  end
  
  def update
    @point = Point.find(params[:id])
    if @point.update_attributes(points_params)
      flash[:success] = "拠点情報を更新しました。"
    else
      flash[:danger] = "拠点情報の更新ができませんでした。<br>" + @point.errors.full_messages.join("<br>")
    end
     redirect_to points_path
  end  

  def destroy
    @point = Point.find(params[:id])
    @point.destroy
    flash[:success] = "#{@point.point_name}のデータを削除しました。"
    redirect_to points_path
  end  

  private

    def points_params
      params.require(:point).permit(:point_name,:point_number,:attendance_type)
    end
end