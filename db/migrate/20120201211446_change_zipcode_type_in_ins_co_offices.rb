class ChangeZipcodeTypeInInsCoOffices < ActiveRecord::Migration

    change_table :ins_co_offices do |t|
        t.remove :zipcode
        t.string :zipcode
    end

end
