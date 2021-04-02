class Show < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 

    validates_presence_of :name, :description
    accepts_nested_attributes_for :reviews

    # def self.destroy
    #     @shows = Show.where(review_id: @review_id)
    #     @shows.each do |r|
    #         r.destroy
    # end
    #     @review.destroy
    # end

end
