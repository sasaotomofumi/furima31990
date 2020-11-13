# users テーブル

|     Column       |  Type  |   Options   |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |

## Association

-has_many :items
-has_many :orders

# items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product         | string     | null: false                    |
| product detail  | text       | null: false                    |
| user_id         | references | null: false, foreign_key: true |

## Association

-belongs_to :user
-has_one :order

# orders テーブル

| Column        |   Type      |   Options                      |
| ------------- | ----------- | ------------------------------ |
| card_date     | integer     | null: false                    |
| card_month    | integer     | null: false                    |
| card_year     | integer     | null: false                    |
| security_code | integer     | null: false                    |
| postal_code   | integer     | null: false                    |
| municipality  | text        | null: false                    |
| address       | integer     | null: false                    |
| building_name | text        |                                |
| phone_number  | integer     | null: false                    |
| user_id       | references  | null: false, foreign_key: true |
| item_id       | references  | null: false, foreign_key: true |

## Association

-belongs_to :user
-belongs_to :item


