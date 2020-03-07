class ClassRegister < ApplicationRecord
  belongs_to :location
  belongs_to :student
  belongs_to :subject
  has_and_belongs_to_many :tutors
  has_and_belongs_to_many :times_frees
end
