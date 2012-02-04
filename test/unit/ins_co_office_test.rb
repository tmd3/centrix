require 'test_helper'

class InsCoOfficeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: ins_co_offices
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  tel_nr     :string(255)
#  parent_co  :integer
#  created_at :datetime
#  updated_at :datetime
#  address_1  :string(255)
#  address_2  :string(255)
#  city       :string(255)
#  state      :string(255)
#  zipcode    :string(255)
#

