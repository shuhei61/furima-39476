FactoryBot.define do
  factory :user do
    nickname              { 'taro' }
    email                 { Faker::Internet.email }
    password              { 'one111' }
    password_confirmation { password }
    lastname              { '山田' }
    firstname             { '太郎' }
    lastname_kana         { 'ヤマダ' }
    firstname_kana        { 'タロウ' }
    birth_date            { '2000-01-01' }
  end
end
