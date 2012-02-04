class CreateManufacturers < ActiveRecord::Migration
  def self.up
    create_table :manufacturers do |t|
      t.string :name
      t.string :brands
      t.integer :parent_co
      t.string :address_1
      t.string :address_2
      t.string :phone_no
      t.string :fax_no
      t.string :website
      t.string :documents_and_manuals

      t.timestamps
    end
  end

  def self.down
    drop_table :manufacturers
  end
end
