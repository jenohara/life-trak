class User < ApplicationRecord  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i, message: "invalid email address"}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
         #has_secure_password
    
    has_many :journals
    has_many :entries, :through => :journals

    def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0, 20]
       user.username = auth.info.name   # assuming the user model has a name
        # assuming the user model has an image
       # If you are using confirmable and the provider(s) you use validate emails, 
       # uncomment the line below to skip the confirmation emails.
       # user.skip_confirmation!
     end
   end
end          