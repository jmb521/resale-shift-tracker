class RemoveResaleIdFromShiftWorkers < ActiveRecord::Migration
  def change
    remove_column :shift_workers, :resale_id
  end
end
