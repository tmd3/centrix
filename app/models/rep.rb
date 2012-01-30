# == Schema Information
#
# Table name: reps
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  tel_nr     :string(255)
#  fax_nr     :string(255)
#  email      :string(255)
#  office     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Rep < ActiveRecord::Base
end
