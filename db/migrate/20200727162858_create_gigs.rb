class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :venue_name
      t.string :date_time
      t.integer :offer
      t.boolean :accepted
      t.boolean :paid
      t.references :musician, foreign_key: true, null: false
      t.timestamps
    end
  end
end
