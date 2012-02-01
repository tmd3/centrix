class AddZipcodeToInsCoOffices < ActiveRecord::Migration
  def self.up
    add_column :ins_co_offices, :zipcode, :string
  end

  def self.down
    remove_column :ins_co_offices, :zipcode
  end
end
