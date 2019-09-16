class CreateShiftWorkers < ActiveRecord::Migration
  def change
    create_table :shift_workers do |t|
      t.integer :resale_id
      t.integer :shift_id
      t.integer :worker_id
      t.boolean :checked_in, :default => false
      t.timestamps null: false
    end
  end
end
