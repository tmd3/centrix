class MajorChangeToKases < ActiveRecord::Migration

    change_table :kases do |t|

        t.remove  :insuree
        t.remove  :engineer
        t.remove  :claim_nr
        t.remove  :product

        t.string  :case_no
        t.string  :claim_no
        t.integer :assigned_to
        t.integer :owned_by
        t.string  :insured_name
        t.string  :insured_address
        t.string  :insured_city
        t.string  :insured_state
        t.string  :insured_zipcode
        t.string  :insured_phone_no
        t.string  :insured_email
        t.date    :date_of_loss
        t.string  :product
        t.string  :no_of_products
        t.integer :manufacturer
        t.string  :additional_evidence
        t.date    :date_received
        t.date    :promised_by_date
        t.date    :date_sent
        t.integer :report_prepared_by
        t.integer :report_revised_by
        t.date    :billed_until_date
        t.string  :type_of_report
        t.string  :disposition
        t.string  :delivered_by

    end

end
