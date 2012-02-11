class AddCaseNoPrefixToKases < ActiveRecord::Migration
  def self.up
    add_column :kases, :case_no_prefix, :string
  end

  def self.down
    remove_column :kases, :case_no_prefix
  end
end
