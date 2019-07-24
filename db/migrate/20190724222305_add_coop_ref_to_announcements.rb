class AddCoopRefToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_reference :announcements, :coop, foreign_key: true
  end
end
