class AddCoopRefToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :coop, foreign_key: true
  end
end
