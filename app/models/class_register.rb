class ClassRegister < ApplicationRecord
  belongs_to :location
  belongs_to :student
  belongs_to :subject
  has_and_belongs_to_many :tutors
  has_and_belongs_to_many :times_frees

  # validates :description,
  #     presence: true,
  #     length: { minimum: 10, maximum: 300 }
  # validates :student_id, presence: true
  # validates :location_id, presence: true
  # validates :subject_id, presence: true
  # validates :hours_lesson, presence: true
  # validates :lessons_week, presence: true
  # validates :salary, presence: true
  # validates :class_content, presence: true, length: { minimum:10, maximum:300 }

  def self.search(search_1,search_2)
    if search_1 != "" and search_2 != ""
       where("location_id = ? and subject_id LIKE ?","#{search_1}","#{search_2}")
    else
      if search_1 != ""
        where("location_id = ?","#{search_1}")
      else
        where("subject_id = ?","#{search_2}")
      end
    end

  end
end
