# == Schema Information
#
# Table name: manufacturers
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  brands                :string(255)
#  parent_co             :integer
#  address_1             :string(255)
#  address_2             :string(255)
#  phone_no              :string(255)
#  fax_no                :string(255)
#  website               :string(255)
#  documents_and_manuals :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class Manufacturer < ActiveRecord::Base
end
