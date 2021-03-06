# テーブル設計

## users テーブル

  | Column                | type   | Options                   |
  | --------------------- | ------ | ------------------------- |
  | nickname              | string | null: false               |
  | email                 | string | null: false, unique: true |
  | encrypted_password    | string | null: false               |
  | family_name           | string | null: false               |
  | first_name            | string | null: false               |
  | family_name_katakana  | string | null: false               |
  | first_name_katakana   | string | null: false               |
  | birthday              | date   | null: false               |

  ### Association

  - has_many :purchase_logs
  - has_many :items

  ## orders テーブル

  | Column   | type       | Option                         |
  | -------- | ---------- | ------------------------------ |
  | user     | references | null: false, foreign_key: true |
  | item     | references | null: false, foreign_key: true |

  ### Association

  - belong_to :user
  - belong_to :item
  - has_one :address_info

  ## items テーブル

  | Column              | type        | Option      |
  | ------------------- | ----------- | ----------- |
  | item_name        | string      | null: false |
  | item_description | text        | null: false |
  | price               | integer     | null: false |
  | item_status_id   | integer     | null: false |
  | shipping_charge_id  | integer     | null: false |
  | shipping_area_id    | integer     | null: false |
  | category_id         | integer     | null: false |
  | days_to_ship_id     | integer     | null: false |
  | user                | references  | null: false, foreign_key: true |
  ### Association

  - belong_to :user
  - has_one :purchase_log

  ## address_info テーブル
  | Column         | type       | Option      |
  | -------------- | ---------- | ----------  |
  | postal_code    | string     | null: false |
  | prefectures_id | integer    | null: false |
  | municipality   | string     | null: false |
  | address        | string     | null: false |
  | building_name  | string     |             |
  | phone_number   | string     | null: false |
  | purchase_log   | references | null: false, foreign_key: true |

  ### Association

  - belong_to :purchase_log