class AddFieldsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :date, :datetime
    add_column :events, :shift, :text
    add_column :events, :message, :text
  end
end
