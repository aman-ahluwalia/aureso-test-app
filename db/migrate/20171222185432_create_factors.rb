class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :property
      t.string :type
      t.string :resistance

      t.timestamps null: false
    end
  end
end
