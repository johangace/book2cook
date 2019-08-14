class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :city
      t.string :phone_number
      t.integer :zipcode
      t.string :street
      t.string :state
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
