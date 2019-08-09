class AddCoopRefToDiscussions < ActiveRecord::Migration[5.1]
  def change
    add_reference :discussions, :coop, foreign_key: true
  end
end
