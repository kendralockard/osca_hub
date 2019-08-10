class AddCoopIdToCoops < ActiveRecord::Migration[5.1]
  def change
    add_column :coops, :coop_id, :integer
  end
end
