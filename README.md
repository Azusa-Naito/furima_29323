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
| user         | references | null: false, foreign_key: true |

### Association

- has_many :items


## items テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| text      | string     | null: false                    |
| genre     | string     | null: false                    |
| status    | string     | null: false                    |
| bear      | string     | null: false                    |
| price     | integer    | null: false                    |
| ship_from | string     | null: false                    |
| days      | string     | null: false                    |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## addresses テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| block_number   | string     | null: false                    |
| apartment_name | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item