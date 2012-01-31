class CreateCases < ActiveRecord::Migration
  def self.up
    create_table :cases do |t|
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
    drop_table :cases
  end
end
