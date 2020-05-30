class RemoveOverTimeWorkFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :over_time_work, :string
    remove_column :users, :over_time_end, :datetime
    remove_column :users, :over_time_instructor, :string
    remove_column :users, :over_time_request, :string
    remove_column :users, :check_box, :boolean
    remove_column :users, :month_request, :string
    remove_column :users, :change_request, :string
    remove_column :users, :check_tomorrow, :boolean
    remove_column :users, :attendance_after_chenge, :datetime
    remove_column :users, :liaving_after_chenge, :datetime
  end
end
