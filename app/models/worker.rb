class Worker < ActiveRecord::Base
    has_many :shift_workers
    has_many :shifts, through: :shift_workers
   
end
