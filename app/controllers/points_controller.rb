class PointsController < ApplicationController
  
  def index
    @points = Point.all
  end  
  
  def show
  end
  
  def new
    @point = Point.new
  end 
  
  def create
    @point = Point.new(points_params)
    if @point.save
      flash[:success] = '拠点情報を追加しました。'
      redirect_to points_path
    else
      flash[:danger] = "拠点情報を追加できませんでした。"
      redirect_to points_path
    end
  end  
  
  def edit
  end

  def destroy
  end

  private

    def points_params
      params.require(:point).permit(:point_name, :point_number, :attendance_type)
    end
end