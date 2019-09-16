class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :member_number
      t.timestamps null: false
    end
  end
end
