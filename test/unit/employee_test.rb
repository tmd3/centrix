# == Schema Information
#
# Table name: employees
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :string(255)
#  level      :string(255)
#  hire_date  :date
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
