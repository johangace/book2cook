class AddAttributesToBook < ActiveRecord::Migration[6.0]
  def change
     add_column :books, :subtitle, :string
     add_column :books, :dedication, :text
    add_column :books, :footer, :text
  end
end
