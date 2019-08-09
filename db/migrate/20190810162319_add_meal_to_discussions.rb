class AddMealToDiscussions < ActiveRecord::Migration[5.1]
  def change
    add_column :discussions, :meal, :boolean
  end
end
