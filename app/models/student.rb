class Student < ApplicationRecord
  belongs_to :user
  has_many :class_registers
  validates :address, presence: true,
            length: { minimum: 3, maximum: 100 }
end
