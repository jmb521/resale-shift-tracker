class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :resale_id
      t.timestamps null: false
    end
  end
end
