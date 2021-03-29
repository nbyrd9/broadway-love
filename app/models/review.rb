class Review < ApplicationRecord
    belongs_to :user
    belongs_to :show 

    scope(:quantity_search, ->(quantity) { self.where("quantity >= ?", quantity) })

end
