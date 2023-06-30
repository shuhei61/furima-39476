FactoryBot.define do
  factory :item do
    name               { '花' }
    description        { '美しい' }
    category_id        { '2' }
    state_id           { '2' }
    shipcharge_id      { '2' }
    prefecture_id      { '2' }
    shipday_id         { '2' }
    price              { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/curry.png'), filename: 'curry.png')
    end
  end
end
