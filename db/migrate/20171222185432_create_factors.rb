class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :property
      t.string :kind
      t.integer :resistance

      t.timestamps null: false
    end
  end
end
