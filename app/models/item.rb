class Item < ApplicationRecord
  belong_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
      belongs_to :category
      belongs_to :days_to_ship
      belongs_to :item_status
      belongs_to :shipping_area
      belongs_to :shipping_charge
end
