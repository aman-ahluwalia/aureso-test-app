class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :country
      t.string :timezone
      t.references :factor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
