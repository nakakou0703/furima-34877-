## usersテーブル
  |Column                |Type    |Options     |
  |----------------------|--------|------------|
  |nickname              |string  |null: false |
  |email                 |string  |null: false,unique: true|
  |encrypted_password    |string  |null: false |
  |last_name             |string  |null: false |
  |first_name            |string  |null: false |
  |last_name_kana        |string  |null: false |
  |first_name_kana       |string  |null: false |
  |birth_day             |date    |null: false |
### Association
  has_many :items
  has_many :buyers


## itemsテーブル
  |Column      |Type   |Options          |
  |------------|-------|-----------------|
  |name        |string |null: false      |
  |text        |text   |null: false      |
  |user_id     |integer|foreign_key: true|
  |condition_id|integer|foreign_key: true|
  |charges_id  |integer|foreign_key: true|
  |source_id   |integer|foreign_key: true|
  |days_id     |integer|foreign_key: true|
  |category_id |integer|foreign_key: true|
### Association
  belongs_to :user
  has_one :buyer


## buyersテーブル
  |Column |Type   |Options          |
  |-------|-------|-----------------|
  |user_id|integer|foreign_key: true|
  |item_id|integer|foreign_key: true|
### Association
  belongs_to :user
  belongs_to :buyer
  has_one :addresses


## addressesテーブル
  |Column       |Type   |Options          |
  |-------------|-------|-----------------|
  |postal_code  |string |null: false      |
  |source_id    |string |null: false      |
  |municipality |string |null: false      |
  |address      |string |null: false      |
  |building_name|string |                 |
  |phone_number |string |null: false      |
  |buyer_id     |integer|foreign_key: true|
### Association
  belongs_to :buyer
