class Item < ApplicationRecord

  with_options presence: true do
    validates :nickname
    validates :description
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :shipcharge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipday_id, numericality: { other_than: 1 }

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipcharge
  belongs_to :prefecture
  belongs_to :shipday

end
