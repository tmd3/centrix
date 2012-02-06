# == Schema Information
#
# Table name: kases
#
#  id                  :integer         not null, primary key
#  rep                 :integer
#  status              :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  case_no             :string(255)
#  claim_no            :string(255)
#  assigned_to         :integer
#  owned_by            :integer
#  insured_name        :string(255)
#  insured_address     :string(255)
#  insured_city        :string(255)
#  insured_state       :string(255)
#  insured_zipcode     :string(255)
#  insured_phone_no    :string(255)
#  insured_email       :string(255)
#  date_of_loss        :date
#  product             :string(255)
#  no_of_products      :string(255)
#  manufacturer        :integer
#  additional_evidence :string(255)
#  date_received       :date
#  promised_by_date    :date
#  date_sent           :date
#  report_prepared_by  :integer
#  report_revised_by   :integer
#  billed_until_date   :date
#  type_of_report      :string(255)
#  disposition         :string(255)
#  delivered_by        :string(255)
#  location            :string(255)
#


class Kase < ActiveRecord::Base

    def condition_string_for_search_params(search_params)
        condition_string = ""
        search_params.each do
            |key,value|
            if value != "" then
                if Kase.columns_hash[key].type != :integer then
                    value = "'" + value + "'"
                end
                condition_string += key + "=" + value + " and "
            end
        end
        if condition_string != "" then
            condition_string += "0=0"
        end
        return condition_string
    end

end
