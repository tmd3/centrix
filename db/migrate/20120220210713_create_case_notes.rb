class CreateCaseNotes < ActiveRecord::Migration
  def self.up
    create_table :case_notes do |t|
      t.text :note_text
      t.integer :kase
      t.integer :author
      t.boolean :public

      t.timestamps
    end
  end

  def self.down
    drop_table :case_notes
  end
end
