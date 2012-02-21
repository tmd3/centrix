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
#  storage_volume      :string(255)
#  case_no_prefix      :string(255)
#  cause_of_failure    :string(255)
#


class Kase < ActiveRecord::Base

    attr_accessible :id, :rep, :status, :case_no, :claim_no, :assigned_to, :owned_by, :insured_name, :insured_address, :insured_city,
                    :insured_state, :insured_zipcode, :insured_phone_no, :insured_email, :date_of_loss, :product, :no_of_products,
                    :manufacturer, :additional_evidence, :date_received, :promised_by_date, :date_sent, :report_prepared_by,
                    :report_revised_by, :billed_until_date, :type_of_report, :disposition, :delivered_by, :location, :storage_volume,
                    :case_no_prefix, :cause_of_failure;

    validates :case_no, :presence => true;

end
