class AddColumnsToResale < ActiveRecord::Migration
  def change
    add_column :resales, :season, :string
    add_column :resales, :year, :string
  end
end
