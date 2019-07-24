class CreateCoop < ActiveRecord::Migration[5.1]
  def change
    create_table :coops do |t|
      t.string :name
    end
  end
end
