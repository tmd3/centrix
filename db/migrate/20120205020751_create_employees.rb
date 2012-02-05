class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :name
      t.string :user_id
      t.string :level
      t.date :hire_date

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
