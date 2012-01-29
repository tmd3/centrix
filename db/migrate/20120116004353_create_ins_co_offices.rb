class CreateInsCoOffices < ActiveRecord::Migration
  def self.up
    create_table :ins_co_offices do |t|
      t.string :name
      t.string :tel_nr
      t.string :address
      t.integer :parent_co

      t.timestamps
    end
  end

  def self.down
    drop_table :ins_co_offices
  end
end
