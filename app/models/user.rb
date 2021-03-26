class User < ApplicationRecord
has_many :reviews
has_many :shows, through: :reviews
has_secure_password
      
validates_uniqueness_of :username
validates_presence_of :username


end
