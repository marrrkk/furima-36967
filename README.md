# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| image                  | string     | null: false                    |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| category               | string     | null: false                    |
| product_condition      | string     | null: false                    |
| shipping_charges       | integer    | null: false                    |
| shipping_area          | string     | null: false                    |
| shipping_days          | datetime   | null: false                    |
| price                  | integer    | null: false                    |
| seller                 | string     | null: false                    |
| user_id                | string     | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases


## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buyer          | string     | null: false                    |
| purchased_item | string     | null: false                    |
| user_id        | string     | null: false, foreign_key: true |
| item_id        | string     | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_address


## shipping_address テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefectures       | string     | null: false                    |
| municipalities    | string     | null: false                    |
| address           | integer    | null: false                    |
| building          | string     | null: false                    |
| telephone_number  | integer    | null: false                    |
| purchase_id       | string     | null: false, foreign_key: true |

### Association

- belongs_to :purchases
