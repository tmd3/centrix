class AddLocationToCases < ActiveRecord::Migration
  def self.up
    add_column :cases, :location, :string
  end

  def self.down
    remove_column :cases, :location
  end
end
