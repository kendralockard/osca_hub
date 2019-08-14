class RemoveOtherDefaultFromDietaryRestrictions < ActiveRecord::Migration[5.1]
  def change
    change_column_default :dietary_restrictions, :other, nil
  end
end
