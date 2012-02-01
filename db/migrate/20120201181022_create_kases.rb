class CreateKases < ActiveRecord::Migration
  def self.up
    create_table :kases do |t|
      t.string :claim_nr
      t.integer :rep
      t.integer :insuree
      t.integer :product
      t.string :status
      t.integer :engineer

      t.timestamps
    end
  end

  def self.down
    drop_table :kases
  end
end
