class AddCoopRefToMenus < ActiveRecord::Migration[5.1]
  def change
    add_reference :menus, :coop, foreign_key: true
  end
end
