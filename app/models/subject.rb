class Subject < ApplicationRecord
  has_many :class_registers
  has_and_belongs_to_many :tutors
end
