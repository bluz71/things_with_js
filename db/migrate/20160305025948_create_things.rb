class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.integer :count

      t.timestamps null: false
    end
  end
end
