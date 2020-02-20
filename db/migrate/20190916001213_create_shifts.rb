class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.time :start_time
      t.time :end_time
      t.string :description
      t.timestamps null: false
    end
  end
end
