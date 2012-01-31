# == Schema Information
#
# Table name: cases
#
#  id         :integer         not null, primary key
#  claim_nr   :string(255)
#  rep        :integer
#  insuree    :integer
#  product    :integer
#  status     :string(255)
#  engineer   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CaseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
