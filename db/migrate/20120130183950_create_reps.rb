class CreateReps < ActiveRecord::Migration
  def self.up
    create_table :reps do |t|
      t.string :name
      t.string :tel_nr
      t.string :fax_nr
      t.string :email
      t.integer :office

      t.timestamps
    end
  end

  def self.down
    drop_table :reps
  end
end
