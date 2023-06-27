# README

# テーブル設計

## usersテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| lastname           | string     | null: false                    |
| firstname          | string     | null: false                    |
| lastname_kana      | string     | null: false                    |
| firstname_kana     | string     | null: false                    |
| birth_date         | date       | null: false                    |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| shipcharge_id      | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipday_id         | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image
- extend ActiveHash::Associations::ActiveRecordExtensions
-   belongs_to :category
-   belongs_to :state
-   belongs_to :shipcharge
-   belongs_to :prefecture
-   belongs_to :shipday


## ordersテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- extend ActiveHash::Associations::ActiveRecordExtensions
-   belongs_to :prefecture