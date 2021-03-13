## usersテーブル
  |Column                |Type    |Options    |
  |----------------------|--------|-----------|
  |nickname              |string  |null: false|
  |email                 |string  |null: false|
  |password              |string  |null: false|
  |password_confirmation |string  |null: false|
  |last_name             |string  |null: false|
  |first_name            |string  |null: false|
  |last_name_kana        |string  |null: false|
  |first_name_kana       |string  |null: false|
  |birth_year            |integer |null: false|
  |birth_month           |integer |null: false|
  |birth_day             |integer |null: false|
### Association
  has_many :items
  has_many :buyers


## itemsテーブル
  |Column    |Type   |Options          |
  |----------|-------|-----------------|
  |image     |text   |null: false      |
  |item_name |string |null: false      |
  |text      |text   |null: false      |
  |user_id   |integer|foreign_key: true|
  |buyer_id  |integer|foreign_key: true|
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
  |prefectures  |string |null: false      |
  |municipality |string |null: false      |
  |address      |integer|null: false      |
  |building_name|string |                 |
  |phone_number |integer|null: false      |
  |buyer_id     |integer|foreign_key: true|
### Association
  belongs_to :buyer
