# テーブル設計

#### introテーブル

#### mainテーブル
about/online_shop/contact

#### online_shopテーブル

## items テーブル

| Column      | Type       | Options     |
| ------      | ------     | ----------- |
| item        | references | null: false, foreign_key: true |
| item_name   | string     | null: false |
| price       | integer    | null: false |
| description | text       | null: false |

### Association

- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| name          | string | null: false |
| name_kana     | string | null: false |
| postal_code      | string     | null: false |
| shipping_area_id | integer    | null: false |
| city             | string     | null: false |
| block            | string     | null: false |
| building         | string     |
| phone_number     | string     | null: false |
| shipping_cost    | integer    | null: false |
| price            | integer    | null: false |

### Association

- belongs_to :user
- belongs_to :item

#### contactテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| name               | string | null: false |
| name_kana          | string | null: false |
| company name       | string | null: false |
| text               | text   | null: false |

### Association

