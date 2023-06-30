class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :state_id
    validates :shipcharge_id
    validates :prefecture_id
    validates :shipday_id
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipcharge
  belongs_to :prefecture
  belongs_to :shipday
end
