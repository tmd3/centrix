# == Schema Information
#
# Table name: case_notes
#
#  id         :integer         not null, primary key
#  note_text  :text
#                 This is the actual text tyuped by the user.
#  kase       :integer
#                 This is the id of the case to which the note is attached.
#  author     :integer
#                 This is the id in the user table of the user that entered
#                 the note.
#  public     :boolean
#                 This is true if the note is public.
#  created_at :datetime
#  updated_at :datetime
#

class CaseNote < ActiveRecord::Base

    attr_accessible :id, :note_text, :kase, :author, :public, :created_at
end
