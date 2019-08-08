class CreateCookbookEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbook_entries do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
