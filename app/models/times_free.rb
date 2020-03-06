class TimesFree < ApplicationRecord
  has_and_belongs_to_many :tutors
  has_and_belongs_to_many :class_registers
end
