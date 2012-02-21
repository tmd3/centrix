# == Schema Information
#
# Table name: case_notes
#
#  id         :integer         not null, primary key
#  note_text  :text
#  kase       :integer
#  author     :integer
#  public     :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CaseNoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
