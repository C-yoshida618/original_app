# CYCPP

<TOPcontent>
# intro
# main#index
header(Login/Logout/instagram/logo/onlinestoreへのリンク)
about(会社案内とportfolioページへのリンク)/info(news)/products(商品説明とonlinestoreへのリンク)/contact(gmailへのリンク)/footer
<Portfolio>
# main#show
image/contact(gmailへのリンク)
<User registration>注文ページに飛びたい場合は登録を促す
# devise#registration
<Log in>Google SNSログイン認証の導入
# devise#sessions
<Log out>

<Online store>
# product#index
商品のimage/product_name/description/price
# order#index
商品のimage/product_name/description/price
カード情報入力/配送先入力/orderボタン

<Order complete>
# order#show
Back online store/Logout へのリンク

管理者ページについて ログイン後URL直打ち
<Admin>
# admin#new
商品の新規投稿--商品のimage/product_name/description/price
# admin#index
商品一覧管理--delete(商品の削除ボタン)

# online_shopのテーブル設計

# usersテーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| name               | string     | null: false |
| name_kana          | string     | null: false |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| admin              | boolean    | default: false, null: false |

# Association

- has_many :products
- has_many :orders


# products テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| user         | references | null: false, foreign_key: true |
| product_name | string     | null: false |
| description  | text       | null: false |
| price        | integer    | null: false |

# Association

- belongs_to:user
- has_one :order

# Addresses テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| block         | string     | null: false |
| building_name | string     | 
| phone_number  | string     | null: false |

# Association

- belongs_to :user


# orders テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |
| shipping_cost | integer    | null: false |

# Association

- belongs_to :user
- belongs_to :product
- has_one : address

# SNS credentuals テーブル(Google SNS)

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| provider      | string     | null: false |
| uid           | string     | null: false |

# Association

- belongs_to :user

