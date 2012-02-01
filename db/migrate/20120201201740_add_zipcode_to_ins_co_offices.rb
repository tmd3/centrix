class AddZipcodeToInsCoOffices < ActiveRecord::Migration

    change_table :ins_co_offices do |t|
        t.integer :zipcode
    end

end
