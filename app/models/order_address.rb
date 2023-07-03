class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\Z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d+\Z/, message: 'is invalid. Input only number' }
  end

  validate :phone_length_judge

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  def phone_length_judge
    if phone_number.length > 0 && phone_number.length < 10
      errors.add(:phone_number, 'is too short')
    elsif phone_number.length > 11
      errors.add(:phone_number, 'is too long')
    end
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, municipalities:, house_number:,
                   building_name:, phone_number:, order_id: order.id)
  end
end
