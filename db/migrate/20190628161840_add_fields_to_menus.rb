class AddFieldsToMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :starch, :text
    add_column :menus, :protein, :text
    add_column :menus, :vegetable, :text
    add_column :menus, :restrictions, :text
    add_column :menus, :notes, :text
  end
end
