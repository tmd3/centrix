class AddStorageVolumeToKase < ActiveRecord::Migration
  def self.up
    add_column :kases, :storage_volume, :string
  end

  def self.down
    remove_column :kases, :storage_volume
  end
end
