# == Schema Information
#
# Table name: insurance_cos
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class InsuranceCo < ActiveRecord::Base

    attr_accessible :name, :url;

    url_regex =  /^((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix;

    validates :name, :presence => true;

    validates :url,  :presence   => true,
                     :format     => { :with => url_regex },
                     :uniqueness => { :case_sensitive => false };
end;
