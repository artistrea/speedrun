class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
