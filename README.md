# users テーブル

|     Column         |  Type  |   Options   |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birthday           | integer| null: false |


## Association

-has_many :items
-has_many :orders

# items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| product           | string     | null: false                    |
| product_detail    | text       | null: false                    |
| category          | string     | null: false                    |
| product_condition | string     | null: false                    |
| delivery_fee      | string     | null: false                    |
| area              | string     | null: false                    |
| days _to_ship     | string     | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


## Association

-belongs_to :user
-has_one    :order

# orders テーブル

| Column        |   Type      |   Options                      |
| ------------- | ----------- | ------------------------------ |
| user          | references  | null: false, foreign_key: true |
| item          | references  | null: false, foreign_key: true |

## Association

-belongs_to :user
-belongs_to :item
-has_one    :shipping_address

# shipping_address テーブル

| Column        |   Type      |   Options                      |
| ------------- | ----------- | ------------------------------ |
| postal_code   | string      | null: false                    |
| prefectures   | string      | null: false                    |
| municipality  | text        | null: false                    |
| address       | integer     | null: false                    |
| building_name | text        |                                |
| phone_number  | string      | null: false                    |
| order_id      | references  | null: false, foreign_key: true |      

## Association

-belongs-to :order







