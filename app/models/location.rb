class Location < ApplicationRecord
  has_many :tutors
  has_many :class_registers
end
