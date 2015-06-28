class Review < ActiveRecord::Base
  validates :point, numericality: {
            only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
          }

  belongs_to :restaurant
  belongs_to :user
end
