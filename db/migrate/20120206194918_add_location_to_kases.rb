class AddLocationToKases < ActiveRecord::Migration
  def self.up
    add_column :kases, :location, :string
  end

  def self.down
    remove_column :kases, :location
  end
end
