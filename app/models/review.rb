class Review < ApplicationRecord
    belongs_to :user
    belongs_to :show 

    scope(:rating_search, ->(rating) { self.where("rating >= ?", rating) })
    validates_presence_of :rating, :location, :comment
    # scope :sort_rating, lambda {order("rating desc")}
    # scope :rating, lambda {where("rating >=0").order("updated_at")

end
