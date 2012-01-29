class CreateInsuranceCos < ActiveRecord::Migration
  def self.up
    create_table :insurance_cos do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :insurance_cos
  end
end
