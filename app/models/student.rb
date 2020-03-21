class Student < ApplicationRecord
  belongs_to :user

  validates :address, presence: true,
            length: { minimum: 3, maximum: 100 }
end
