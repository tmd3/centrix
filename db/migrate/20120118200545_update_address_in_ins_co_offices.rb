class UpdateAddressInInsCoOffices < ActiveRecord::Migration

    change_table :ins_co_offices do |t|
        t.remove :address
        t.string :address_1
        t.string :address_2
        t.string :city
        t.string :state
    end

end
