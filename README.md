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
  - has_many :products

  ## purchase_logs テーブル

  | Column   | type       | Option                         |
  | -------- | ---------- | ------------------------------ |
  | user     | references | null: false, foreign_key: true |
  | product  | references | null: false, foreign_key: true |

  ### Association

  - belong_to :user
  - belong_to :product
  - has_one :address_info

  ## products テーブル

  | Column              | type        | Option      |
  | ------------------  | ----------- | ----------- |
  | product_name        | string      | null: false |
  | product_description | string      | null: false |
  | price               | integer     | null: false |
  | product_status_id   | integer     | null: false |
  | shipping_charge_id  | integer     | null: false |
  | shipping_area_id    | integer     | null: false |
  | category_id         | integer     | null: false |
  | days_to_ship_id     | integer     | null: false |
  | user                | references  | null: false, foreign_key: true |
  | purchase_log        | references  | null: false, foreign_key: true |
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
  | phone_number   | integer    | null: false |
  | purchase_log   | references | null: false, foreign_key: true |

  ### Association

  - belong_to :purchase_log