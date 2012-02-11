class CreateKaseIdGenerators < ActiveRecord::Migration
  def self.up
    create_table :kase_id_generators do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :kase_id_generators
  end
end
