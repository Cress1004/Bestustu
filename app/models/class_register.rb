class ClassRegister < ApplicationRecord
  belongs_to :location
  belongs_to :student
  belongs_to :subject
  has_and_belongs_to_many :tutors
  has_and_belongs_to_many :times_frees


  def self.search(search_1,search_2)
    if search_1 != "" and search_2 != ""
       ClassRegister.joins(:location).where("locations.city = ? and subject_id = ?","#{search_1}","#{search_2}")
    else
      if search_1 != ""
        ClassRegister.joins(:location).where("locations.city = ?","#{search_1}")
      else
        where("subject_id = ?","#{search_2}")
      end
    end
  end
end
