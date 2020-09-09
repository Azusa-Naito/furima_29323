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

# テーブル設計

## users テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| nickname     | string     | null: false                    |
| email        | string     | null: false                    |
| password     | string     | null: false                    |
| last_name    | string     | null: false                    |
| first_name   | string     | null: false                    |
| last_name_k  | string     | null: false                    |
| first_name_k | string     | null: false                    |
| birthday     | date       | null: false                    |

### Association

- has_many :items
- has_many :purchases


## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| text         | text       | null: false                    |
| genre_id     | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| bear_id      | integer    | null: false                    |
| price        | integer    | null: false                    |
| from_id      | integer    | null: false                    |
| days_id      | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## addresses テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| block_number   | string     | null: false                    |
| apartment_name | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key :true |

### Association

- belongs_to :purchase


## purchase テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address