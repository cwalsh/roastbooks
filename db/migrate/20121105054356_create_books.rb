class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :title_long
      t.string :authors
      t.text :publisher
      t.string :isbn
      t.string :isbn13
      t.string :publisher_id

      t.timestamps
    end
  end
end
