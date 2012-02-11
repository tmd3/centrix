# == Schema Information
#
# Table name: kase_id_generators
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class KaseIdGenerator < ActiveRecord::Base

    attr_accessible :id;

end
