class AddCaseNoPrefixToCases < ActiveRecord::Migration
  def self.up
    add_column :cases, :case_no_prefix, :string
  end

  def self.down
    remove_column :cases, :case_no_prefix
  end
end
