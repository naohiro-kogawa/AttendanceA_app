class Point < ApplicationRecord
    
  validates :point_name, presence: true ,length: { maximum: 30 }  
  validates :point_number, presence: true , numericality:{ less_than_or_equal_to: 100 } #指定された値と等しいか、あるいは小さいか
  validates :attendance_type, presence: true    
end
