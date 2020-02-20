class CreateShiftWorkers < ActiveRecord::Migration
  def change
    create_table :shift_workers do |t|
      t.integer :shift_id
      t.integer :worker_id
      t.integer :resale_id
      t.boolean :checked_in, :default => false
      t.string :member_number_they_worked_for
      t.timestamps null: false
    end
  end
end
