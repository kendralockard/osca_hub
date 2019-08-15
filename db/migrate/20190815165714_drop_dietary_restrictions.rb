class DropDietaryRestrictions < ActiveRecord::Migration[5.2]
  def change
    drop_table :dietary_restrictions
  end
end
