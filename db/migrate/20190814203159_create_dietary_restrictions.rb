class CreateDietaryRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :dietary_restrictions do |t|
      t.boolean :vegetarian, default: false
      t.boolean :vegan, default: false
      t.boolean :honey, default: false
      t.text :honey_severe
      t.boolean :nuts, default: false
      t.text :nuts_severe
      t.boolean :gluten, default: false
      t.text :gluten_severe
      t.boolean :soy, default: false
      t.text :soy_severe
      t.text :other, default: false
      t.references :user, foreign_key: true
      t.references :coop, foreign_key: true
    end
  end
end
