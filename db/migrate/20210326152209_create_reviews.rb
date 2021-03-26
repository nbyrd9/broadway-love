class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :show_id
      t.string :rating
      t.string :location
      t.string :comment

      t.timestamps
    end
  end
end
