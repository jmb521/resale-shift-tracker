class ShiftWorker < ActiveRecord::Base
    belongs_to :shift
    belongs_to :worker
    
end
