# テーブル設計

## users テーブル

  | Column   | type   | Options     |
  | -------- | ------ | ----------- |
  | nickname | string | null: false |
  | email    | string | null: false |
  | password | string | null: false |
  | name     | string | null: false |
  | birthday | string | null: false |

  ### Association

  - has_many :purchase_logs
  - has_many :products

  ## purchase_logs テーブル

  | Column   | type   |
  | -------- | ------ |
  | buy_log  | string |
  | sell_log | string |
  | buy_man  | string |

  ### Association

  - belong_to :users
  - belong_to :products
  - belong_to :address_info

  ## products テーブル

  | Column      | type    | Option      |
  | ----------- | ------  | ----------- |
  | post_text   | text    | null: false |
  | seller_name | string  | null: false |
  | price       | integer | null: false |

  ### Association

  - belong_to :users
  - has_one :purchase_logs

  ## address_info テーブル
  | Column        | type    | Option      |
  | ------------- | ------- | ----------  |
  | postal_code   | string  | null: false |
  | municipality  | string  | null: false |
  | address       | string  | null: false |
  | building_name | string  |             |
  | phone_number  | integer | null: false |

  ### Association

  - belong_to :purchase_logs