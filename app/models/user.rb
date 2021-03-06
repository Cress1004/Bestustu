class User < ApplicationRecord
  has_one :student
  has_one :tutor
  has_many :messages

  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

   mount_uploader :image, ImageUploader

   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook],
          :authentication_keys => [:username]
  before_save { self.username = username.downcase }
  before_save { self.username = username.strip }
  before_save { self.phone = phone.strip }
  # validates :email, presence: true
  # validates :username, presence: true,
  #           length: { minimum: 4, maximum: 15 },
  #           format: { with: /\A[a-zA-Z]+\z/,
  #           message: "Username only allows letters" }
  # validates :name, presence: true

#  validates :phone, presence: false,
#            format: { with: /\(?[0-9]{10}/,
#            message: "Phone numbers must be 10 number characters." }


   def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
       end
     end
   end

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.name = auth.info.name   # assuming the user model has a name
       user.image = auth.info.image # assuming the user model has an image
       user.skip_confirmation!
     end
   end
end
