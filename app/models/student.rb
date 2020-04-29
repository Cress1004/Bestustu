class Student < ApplicationRecord
  belongs_to :user
  has_many :class_registers
  has_many :students_tutors
  has_many :tutors, through: :students_tutors
end
