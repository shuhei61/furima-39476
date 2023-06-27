# README

# テーブル設計

## usersテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| nickname         | string     | null: false                    |
| email            | string     | null: false, unique: true      |
| password         | string     | null: false                    |
| encrypt_password | string     | null: false                    |
| lastname         | string     | null: false                    |
| firstname        | string     | null: false                    |
| lastname_kana    | string     | null: false                    |
| firstname_kana   | string     | null: false                    |
| birth_year       | integer    | null: false                    |
| birth_month      | integer    | null: false                    |
| birth_date       | integer    | null: false                    |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category         | string     | null: false                    |
| state            | string     | null: false                    |
| ship_charge      | string     | null: false                    |
| ship_from        | string     | null: false                    |
| ship_day         | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image


## ordersテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| buyer            | string     | null: false                    |
| item             | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
- belongs_to :order