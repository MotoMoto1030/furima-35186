class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :item_status
  belongs_to :shipping_area
  belongs_to :shipping_charge

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :days_to_ship_id
      validates :item_status_id
      validates :shipping_area_id
      validates :shipping_charge_id
    end
    with_options numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' } do
      validates :price
    end
  end
  with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                               message: 'は¥300~¥9999999の範囲で入力してください' } do
    validates :price
  end
end
