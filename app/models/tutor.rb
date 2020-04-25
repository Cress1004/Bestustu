class Tutor < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_and_belongs_to_many :times_frees
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :class_registers
  has_many :students_tutors
  has_many :students, through: :students_tutors

  ratyrate_rateable 'point'

  def self.search_by_subject_name(search)
      Tutor.joins('INNER JOIN subjects_tutors ON tutors.id = subjects_tutors.tutor_id INNER JOIN subjects on subjects_tutors.subject_id = subjects.id').where("subjects.name = ?","#{search}")
  end

  def self.search_by_location_name(search)
      Tutor.joins('INNER JOIN locations on tutors.location_id = locations.id').where("locations.city = ?","#{search}")
  end


  def self.search(search_1,search_2)
    if search_1 != "" and search_2 != ""
      Tutor.joins(:subjects_tutors,:location).where("locations.city = ? and subjects_tutors.subject_id = ?","#{search_1}","#{search_2}")
    else
      if search_1 != ""
        Tutor.joins(:location).where("locations.city = ?","#{search_1}")
      else
        Tutor.joins(:subjects_tutors).where("subjects_tutors.subject_id = ?","#{search_2}")
      end
    end
  end
end
