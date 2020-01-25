class Point < ApplicationRecord
    
  validates :point_name, presence: true
  validates :point_number, length: { in: 1..50 }, allow_blank: true
  validates :attendance_type, presence: true    
end
