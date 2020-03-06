class Student < ApplicationRecord
  belongs_to :user
  has_many :class_registers
end
