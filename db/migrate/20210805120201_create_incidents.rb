class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.datetime :date
      t.text :description
      t.string :media
      t.references :antagonizer, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end