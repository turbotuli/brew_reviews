class CreateBrews < ActiveRecord::Migration[5.0]
  def change
    create_table :brews do |t|
      t.string :name, null: false
      t.string :description
      t.integer :rating
      t.timestamps
    end
  end
end
