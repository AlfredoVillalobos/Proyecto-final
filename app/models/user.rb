class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable, :omniauthable, 
         omniauth_providers: [:google_oauth2, :facebook]
  
  geocoded_by :address
  after_validation :geocode

  enum role: [:admin, :visit]
  has_many :identities, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  def name
    email.split('@')[0]
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
 
    if user.nil?
      email = auth.info.email
      user = User.find_by(email: email) if email
 
      # Create the user if it's a new registration
      if user.nil?
        password = Devise.friendly_token[0,20]
        if auth.provider == 'facebook'
          user = User.new(
            email: email ? email : "#{auth.uid}@change-me.com",
            name: auth.info.first_name,
            password: password,
            password_confirmation: password
          )
        elsif auth.provider == 'google_oauth2'
          user = User.new(
            email: email ? email : "#{auth.uid}@change-me.com",
            name: auth.info.first_name, 
            password: password,
            password_confirmation: password
          )
        end
      end
      user.save!
    end
 
    if identity.user != user
      identity.user = user
      identity.save!
    end
    
    user
  end
 
  def email_verified?
    if self.email
      if self.email.split('@')[1] == 'change-me.com'
        return false
      else
        return true
      end
    else
      return false
    end
  end
end
