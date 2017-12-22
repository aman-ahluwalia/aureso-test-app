class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :slug, :primary => true
      t.integer :max_speed
      t.string :speed_unit

      t.timestamps null: false
    end
  end
end
