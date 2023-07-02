class OrderAddress（先頭大文字）
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :order_id

  with_options presence: ture do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :building_name
    validates :validates :phone_number, format: { with: /\A\d+\Z/, message: 'is invalid. Input only number.' }
    validates :order_id
  end

  validates :phone_number, length: { minimum: 10, maximum: 11 }
  validate :phone_length_judge

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  def phone_length_judge
    if phone_number.present? && phone_number.length < 10
      errors.add(:phone_number, 'Phone number is too short')
    elsif phone_number.present? && phone_number.length > 11
      errors.add(:phone_number, 'Phone number is too long')
    end
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities,house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order_id )
  end
end
