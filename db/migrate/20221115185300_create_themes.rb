class CreateThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :themes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :themes, :name, unique: true
  end
end
