# README

## dearsテーブル

| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| nickname               | string           | null:false              |
| birth_day              | date             |                         |
| memo                   | text             |                         |
| favorite_color         | string           |                         |


### Association
- has_many :presents


## usersテーブル

| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| nickname               | string           | null:false              |
| email                  | string           | null:false, unique:true |
| encrypted_password     | string           | null:false              |

### Association
- has_many :presents