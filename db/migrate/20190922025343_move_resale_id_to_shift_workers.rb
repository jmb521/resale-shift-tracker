class MoveResaleIdToShiftWorkers < ActiveRecord::Migration
  def change
    remove_column :shifts, :resale_id
    add_column :shift_workers, :resale_id, :integer
  end
end
