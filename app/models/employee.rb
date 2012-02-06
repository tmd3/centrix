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

class Employee < ActiveRecord::Base
end
