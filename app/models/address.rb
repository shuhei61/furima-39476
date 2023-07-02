class Address < ApplicationRecord

  with_options presence: true do
    validates :post_code
    validates :municipalities
    validates :house_number
    validates :building_name
    validates :phone_number, format: { with: /\A\d+\Z/, message: 'is invalid. Input only number.' }
  end

  validates :phone_number, length: { minimum: 10, maximum: 11 }
  validate :phone_length_judge

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def phone_length_judge
    if phone_number.present? && phone_number.length < 10
      errors.add(:phone_number, 'Phone number is too short')
    elsif phone_number.present? && phone_number.length > 11
      errors.add(:phone_number, 'Phone number is too long')
    end
  end

end
