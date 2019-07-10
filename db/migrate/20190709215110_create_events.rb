class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :date
      t.text :shift
      t.text :message
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :events, [:user_id, :created_at]
  end
end
