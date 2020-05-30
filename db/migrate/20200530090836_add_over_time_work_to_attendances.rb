class AddOverTimeWorkToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :over_time_work, :string
    add_column :attendances, :over_time_end, :datetime
    add_column :attendances, :over_time_instructor, :string
    add_column :attendances, :over_time_request, :string
    add_column :attendances, :check_box, :boolean
    add_column :attendances, :month_request, :string
    add_column :attendances, :change_request, :string
    add_column :attendances, :check_tomorrow, :boolean
    add_column :attendances, :attendance_after_chenge, :datetime
    add_column :attendances, :liaving_after_chenge, :datetime
  end
end
