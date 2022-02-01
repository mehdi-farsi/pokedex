class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :external_id
      t.string :name
      t.string :primary_type
      t.string :secondary_type
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.string :generation
      t.boolean :legendary

      t.timestamps

      t.index :external_id
      t.index :name
    end
  end
end
