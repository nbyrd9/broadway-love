class Review < ApplicationRecord
    belongs_to :user
    belongs_to :show 

    scope(:rating_search, ->(rating) { self.where("rating >= ?", rating) })

end
