class AddOverTimeWorkToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :over_time_work, :string
    add_column :users, :over_time_end, :datetime
    add_column :users, :over_time_instructor, :string
    add_column :users, :over_time_request, :string
    add_column :users, :check_box, :boolean
    add_column :users, :month_request, :string
    add_column :users, :change_request, :string
    add_column :users, :check_tomorrow, :boolean
    add_column :users, :attendance_after_chenge, :datetime
    add_column :users, :liaving_after_chenge, :datetime
  end
end
