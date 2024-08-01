# テーブル設計

#### intro

#### main
about/info/products/online_store/contact

#### online_shop

## usersテーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| name               | string     | null: false |
| name_kana          | string     | null: false |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| admin              | boolean    | default: false, null: false |

### Association

- has_many :products
- has_many :orders


## products テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| user         | references | null: false, foreign_key: true |
| product_name | string     | null: false |
| description  | text       | null: false |
| price        | integer    | null: false |

### Association

- belongs_to:user
- has_one :order

## Addresses テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| block         | string     | null: false |
| building_name | string     | 
| phone_number  | string     | null: false |

### Association

- belongs_to :user


## orders テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |
| shipping_cost | integer    | null: false |

### Association

- belongs_to :user
- belongs_to :product
- has_one : address

