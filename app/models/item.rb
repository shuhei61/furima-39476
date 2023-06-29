class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: {with: /\A[3-9]\d{2,6}\Z/, message: "Price is out of setting range"}
  end

  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :state_id
    validates :shipcharge_id
    validates :prefecture_id
    validates :shipday_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipcharge
  belongs_to :prefecture
  belongs_to :shipday

end
