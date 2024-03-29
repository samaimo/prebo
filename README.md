# README

## usersテーブル

| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| nickname               | string           | null:false              |
| email                  | string           | null:false, unique:true |
| encrypted_password     | string           | null:false              |

### Association
- has_many :presents
- has_one_attached :image

## dearsテーブル

| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| nickname               | string           | null:false              |
| birth_day              | date             |                         |
| memo                   | text             |                         |
| favorite_color         | string           |                         |

### Association
- has_many :presents
- has_one_attached :image


## presentsテーブル

| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| name                   | string           | null:false              |
| event_name             | text             | null:false              |
| text                   | text             | null:false              |
| price                  | integer          |                         |
| shop_name              | string           |                         |
| memo                   | text             |                         |
| url                    | text             |                         |

### Association
- belongs_to :dear
- has_one_attached :image