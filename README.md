# README

# アプリケーション名
CYCPP

# URL

# テスト用アカウント
・Basic認証パスワード：2222<br>
・Basic認証ID：admin<br>

# 利用方法とページ案内
・TOPページ<br>
header(Login/Logout/instagram/logo/onlinestoreへのリンク)<br>
about(会社案内とportfolioページへのリンク)/info(news)<br>
products(商品説明とonlinestoreへのリンク)/contact(gmailへのリンク)/footer<br>
image/contact(gmailへのリンク)
<br>
・Portfolioページ
・User registration　注文ページに飛びたい場合は登録を促す<br>

・Log in　Google SNSログイン認証の導入<br>
・Log out<br>

・Online storeページ
product#index<br>
商品のimage/product_name/description/price
order#index<br>
商品のimage/product_name/description/price<br>
カード情報入力/配送先入力/orderボタン<br>

・Order completeページ
・order#show<br>
・Back online store/Logout へのリンク<br>

・管理者ページについて ログイン後URL直打ち<br>
Admin<br>
admin#new<br>
商品の新規投稿--商品のimage/product_name/description/price<br>
admin#index<br>
商品一覧管理--delete(商品の削除ボタン)

# Onlinestoreのデータベース設計

・usersテーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| name               | string     | null: false |
| name_kana          | string     | null: false |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| admin              | boolean    | default: false, null: false |

・Association

- has_many :products
- has_many :orders


・products テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| user         | references | null: false, foreign_key: true |
| product_name | string     | null: false |
| description  | text       | null: false |
| price        | integer    | null: false |

・Association

- belongs_to:user
- has_one :order

・Addresses テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| block         | string     | null: false |
| building_name | string     | 
| phone_number  | string     | null: false |

・Association

- belongs_to :user


・orders テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |
| shipping_cost | integer    | null: false |

・Association

- belongs_to :user
- belongs_to :product
- has_one : address

・SNS credentuals テーブル(Google SNS)

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| provider      | string     | null: false |
| uid           | string     | null: false |

・Association

- belongs_to :user

# 開発環境と工夫したポイント

・"cancancan"gemの導入によりユーザーページと管理者ページで管理可能<br>
・フロントエンドのJSアニメーション導入によりユーザーエンゲージメントを高めるられるように工夫
