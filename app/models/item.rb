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
  
end
