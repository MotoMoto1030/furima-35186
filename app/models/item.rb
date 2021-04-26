class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
      belongs_to :category
      belongs_to :days_to_ship
      belongs_to :item_status
      belongs_to :shipping_area
      belongs_to :shipping_charge
    
    with_options presence: true do
      validates :item_name
      validates :item_description
        with_options numericality: { other_than: 1 } do
          validates :category_id
          validates :days_to_ship_id
          validates :item_status_id
          validates :shipping_area_id
          validates :shipping_charge_id
        end
            with_options format: { with:/\A[0-9]+\z/, message: 'Price Half-width number'} do
              validates :price
            end
    end
end
