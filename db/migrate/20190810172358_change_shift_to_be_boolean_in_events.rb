class ChangeShiftToBeBooleanInEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :shift, 'boolean USING shift::boolean'
  end
end
