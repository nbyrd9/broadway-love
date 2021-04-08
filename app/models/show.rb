class Show < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 

    validates_presence_of :name, :description
    accepts_nested_attributes_for :reviews

end
