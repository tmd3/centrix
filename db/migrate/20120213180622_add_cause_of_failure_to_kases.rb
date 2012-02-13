class AddCauseOfFailureToKases < ActiveRecord::Migration
  def self.up
    add_column :kases, :cause_of_failure, :string
  end

  def self.down
    remove_column :kases, :cause_of_failure
  end
end
