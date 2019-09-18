class Shift < ActiveRecord::Base
    has_many :shift_workers
    has_many :workers, through: :shift_workers
end
