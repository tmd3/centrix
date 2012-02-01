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
#  zipcode    :integer
#

class InsCoOffice < ActiveRecord::Base

    attr_accessible :name, :tel_nr, :parent_co, :address_1, :address_2, :city, :state, :zipcode;

    validates :name, :presence => true;

end;
