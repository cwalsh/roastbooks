class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :location
      t.text :description
      t.references :owner

      t.timestamps
    end
    add_index :libraries, :owner_id
  end
end
