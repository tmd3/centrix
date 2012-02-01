class AddZipToInsCoOffices < ActiveRecord::Migration
  def self.up
    add_column :ins_co_offices, :zip, :string
  end

  def self.down
    remove_column :ins_co_offices, :zip
  end
end
