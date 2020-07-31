class CreateMusicians < ActiveRecord::Migration[6.0]
  def change
    create_table :musicians do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.integer :number_of_members
      t.string :lead_member
      t.integer :minimum_garuntee
      t.timestamps
    end
  end
end
