class AddColumnsToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :resale_date, :date
    add_column :shifts, :start_time, :time
    add_column :shifts, :end_time, :time
    add_column :shifts, :description, :string
    

  end
end
