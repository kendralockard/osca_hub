class AddMealToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :meal, :boolean
  end
end
