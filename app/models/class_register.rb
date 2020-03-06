class ClassRegister < ApplicationRecord
  belongs_to :location
  belongs_to :student
  belongs_to :subject
end
