class CreateDictionaries < ActiveRecord::Migration[8.0]
  def change
    create_table :dictionaries do |t|
      t.string :word, null: false
      t.string :sorted_letters, null: false
      t.integer :length, null: false

      t.timestamps
    end

    add_index :dictionaries, :word, unique: true
    add_index :dictionaries, [ :sorted_letters, :length ]
  end
end
