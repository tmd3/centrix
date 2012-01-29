class AddInsuranceCoUrlUniquenessIndex < ActiveRecord::Migration

    def self.up
        add_index :insurance_cos, :url, :unique => true;
    end;

    def self.down
        remove_index :insurance_cos, :url;
    end;

end;
