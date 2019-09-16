class CreateResales < ActiveRecord::Migration
  def change
    create_table :resales do |t|
      t.string :spreadsheet
      t.string :admin_id
      t.timestamps null: false
    end
  end
end
