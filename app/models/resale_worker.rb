class ResaleWorker < ActiveRecord::Base
    belongs_to :resale
    belongs_to :worker
end
