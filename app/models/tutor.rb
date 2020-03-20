class Tutor < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_and_belongs_to_many :times_frees
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :class_registers

  validates :job, presence: true,
            length: { minimum: 3, maximum: 30 }
  # validates :work_place, presence: true,
  #         length: { minimum: 3, maximum: 100 }
  validates :description,
            length: { minimum: 10, maximum: 500 }
  validates :achievement,
            length: { minimum: 10, maximum: 500 }
end
