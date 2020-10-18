# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#usersテーブル

| Column             |  Type   | Options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| full_name          | string  | null: false |
| full_name_kana     | string  | null: false |
| birth_day          | date    | null: false |
| team_id            | integer | null: false |

###Association
- has_many :tweets
- has_many :items
- has_many :tweet_comments
- has_many :item_comments
- has_many :orders
- belongs_to_active_hash :team

#tweetsテーブル

| Column           |  Type      | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| team_id          | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| tweet_comment    | references | null: false, foreign_key: true |

###Association
- belongs_to :user
- has_many :tweet_comments
- belongs_to_active_hash :team

#tweet_comments
| Column           |  Type      | Options                        |
|------------------|------------|--------------------------------|
| text             | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| tweet            | references | null: false, foreign_key: true |


###Association
- belongs_to :user
- belongs_to :tweet

#item_comments
| Column           |  Type      | Options                        |
|------------------|------------|--------------------------------|
| text             | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |


###Association
- belongs_to :user
- belongs_to :item


#itemsテーブル
| Column           |  Type      | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| sender_area_id   | integer    | null: false                    |
| number_of_day_id | integer    | null: false                    |
| money            | integer    | null: false                    |
| user             | references | null: false, foreign_key :true |

###Association
- belongs_to :user
- has_many :item_comments
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :sender_area
- belongs_to_active_hash :number_of_day


#ordersテーブル
| Column     |  Type      | Options                       |
|------------|------------|-------------------------------|
| user       | references | null:false, foreign_key :true |
| item       | references | null:false, foreign_key :true |

###Association
- belongs_to :user
- belongs_to :item
- has_one :address

#addressesテーブル
| Column        |  Type      | Options                       |
|---------------|------------|-------------------------------|
| postal_code   | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city  | string     | null: false                   |
| house_number  | string     | null: false                   |
| building_name | string     |                               |
| tel           | string     | null:false                    |
| order      | references | null:false, foreign_key :true |

###Association
- belongs_to :order
- belongs_to_active_hash :sender_area





