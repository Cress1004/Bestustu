class Tutor < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_and_belongs_to_many :times_frees
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :class_registers

  mount_uploader :image, ImageUploader

  ratyrate_rateable 'point'

  # validates :job, presence: true,
  #           length: { minimum: 3, maximum: 30 }
  # validates :work_place, presence: true,
  #           length: { minimum: 3, maximum: 100 }
#  validates :description,
#            length: { minimum: 10, maximum: 300 }
#  validates :achievement,
#            length: { minimum: 10, maximum: 300 }

  def self.search_by_subject_name(search)
      Tutor.joins('INNER JOIN subjects_tutors ON tutors.id = subjects_tutors.tutor_id INNER JOIN subjects on subjects_tutors.subject_id = subjects.id').where("subjects.name = ?","#{search}")
  end

  def self.search_by_location_name(search)
      Tutor.joins('INNER JOIN locations on tutors.location_id = locations.id').where("locations.city = ?","#{search}")
  end

  def self.search_by_location(params)
    if params != ""
      where("location_id = ?","#{params}")
    else
      where("location_id = ?","#{params}")
    end
  end


    def self.search(search_1,search_2)
      if search_1 != "" and search_2 != ""
        Tutor.joins(:subjects_tutors).where("location_id = ? and subjects_tutors.subject_id = ?","#{search_1}","#{search_2}")
      else
        if search_1 != ""
          where("location_id = ?","#{search_1}")
        else
          Tutor.joins(:subjects_tutors).where("subjects_tutors.subject_id = ?","#{search_2}")
        end
      end
    end
end
