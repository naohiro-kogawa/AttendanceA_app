class Point < ApplicationRecord
    
  validates :point_name, presence: true ,length: { in: 1..30 }  
  validates :point_number, presence: true
  validates :attendance_type, presence: true    
end