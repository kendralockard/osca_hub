class AddMealToMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :meal, :boolean
  end
end
