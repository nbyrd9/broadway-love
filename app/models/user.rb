class User < ApplicationRecord
has_many :reviews
has_many :shows, through: :reviews
has_secure_password
      
validates_uniqueness_of :username
validates_presence_of :username


    def self.from_omniauth(user)                  
        where(email: user.info.email).first_or_intialize do |u|
        u.provider="google_oauth2"
        u.first_name = user.info.first_name
        u.last_name = user.info.last_name
        u.email = user.info.email
        end
    end
end
