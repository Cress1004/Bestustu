class User < ApplicationRecord
  has_one :student
  has_one :tutor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

   mount_uploader :image, ImageUploader

   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable,
          :omniauthable, :omniauth_providers => [:facebook],
          :authentication_keys => [:username]

  validates :phone_number, presence: true,
            uniqueness: {case_sensitive: false}

  validates_format_of :phone_number,
                      :with => /\(?[0-9]{4}\)?-[0-9]{3}-[0-9]{3}/,
                      :message => "- Phone numbers must be in xxxx-xxx-xxx format."

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
