class Worker < ActiveRecord::Base
    has_many :shift_workers
    has_many :shifts, through: :shift_workers
    has_many :resale_workers
    has_many :resales, through: :resale_workers

    def self.search(name)
        Worker.where("last_name LIKE ?", "%#{name}%")
    end

end
