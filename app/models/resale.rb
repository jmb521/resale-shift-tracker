class Resale < ActiveRecord::Base
    # has_many :shift_workers
    # has_many :shifts, through: :shift_workers
    # has_many :workers, through: :shift_workers
    has_many :shifts
    has_many :resale_workers
    has_many :workers, through: :resale_workers
    # def shift_count
    #     count_hash = {}
    #   self.shifts.each do |shift|
    #         shift.workers.each do |s|
                
    #             name = s.first_name + s.last_name
    #             if count_hash[name] 
    #                 count_hash[name] += 1
    #             else
    #                 count_hash[name]
    #             end

    #         end
    #     end
    #     count_hash
    # end

        
    
end
