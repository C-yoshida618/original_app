# README

# アプリケーション名
CYCPP

# アプリの概要
・会社案内<br>
・実績ポートフォリオ<br>
・プロダクトオンラインストア<br>
・ユーザー登録
・SNS(instagram連携)<br>
・SNS google認証<br>
・仕事依頼contact<br>

# URL
https://original-app-pg5p.onrender.com

# テスト用アカウント
・Basic認証パスワード：2222<br>
・Basic認証ID：admin<br>

# 実装したGIF動画・ページ案内

https://i.gyazo.com/2fd3ceaf8b7eaf46094c772926ae8a1d.gif

↓下記URLにより詳細を掲載しています。<br>
https://share.zight.com/9ZuJgq6B.gif<br>

・TOPページ<br>
header(Login/Logout/instagram/logo/onlinestoreへのリンク)<br>
about(会社案内とportfolioページへのリンク)/info(news)<br>
products(商品説明とonlinestoreへのリンク)/contact(gmailへのリンク)/footer<br>
image/contact(gmailへのリンク)
<br>

・Portfolioページ<br>
仕事依頼や問い合わせのメールへのリンク

・商品購入のためのユーザー登録機能<br>
ユーザー登録　注文ページに飛びたい場合は登録を促す<br>

・Log in　Google SNSログイン認証の導入<br>
・Log out<br>

・Online storeページ
product#index<br>
商品のimage/product_name/description/price
order#index<br>
商品のimage/product_name/description/price<br>
配送料の計算 都道府県によって送料が異なるため、jsで地域別の配送料を設定<br>
クレジット機能：カード情報入力/配送先入力/orderボタン<br>

・Order completeページ
・order#show<br>
・Back online store/Logout へのリンク<br>

・管理者ページについて 

"cancancan"gemの導入によりユーザーページと管理者ページで管理可能<br>　
ログイン後URL直打ち<br>
Adminページ admin#new<br>
商品の新規投稿--商品のimage/product_name/description/price<br>
admin#index<br>
商品一覧管理ページ

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

# アプリケーションを作成した背景
・今まで携わっていた業務委託のお仕事依頼でご依頼いただくまでの時間や手間を省けるツールがあると便利だなと感じていたことや、自分の趣味の陶芸作品のオンラインストアを作ってみたかったので今回作成してみた。
ビジュアル化により、イメージや商品をユーザーにわかりやすく共有したいと思った。

# 改善点
・外部サービスの利用やポートフォリオページの充実を図ることで、利便性を向上し、ユーザーエンゲージメントを高めたい。
・BASEやLINEなどの外部サービス利用し新規ユーザー獲得を促進することも検討したい。
・ポートフォリオについては成果物を豊富に掲載することでユーザーの関心を引き付けられるよう、もっと知識を深めたい。
