class Tutor < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_and_belongs_to_many :times_frees
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :class_registers
end
