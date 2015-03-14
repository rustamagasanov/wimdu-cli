class CreateProperties < ActiveRecord::Migration
  def up
    create_table :properties do |t|
      t.string :slug
      t.string :title
      t.string :address
      t.integer :rate
      t.integer :max_guests
      t.string :email
      t.string :phone
    end
  end

  def down
    drop_table :properties
  end
end
