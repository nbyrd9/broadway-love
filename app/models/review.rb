class Review < ApplicationRecord
    belongs_to :user
    belongs_to :show 

    scope(:rating_search, ->(rating) { self.where("rating = ?", rating) })

    validates_presence_of :rating, :location, :comment
    validates :rating, :inclusion => 1..5

    
   

end
