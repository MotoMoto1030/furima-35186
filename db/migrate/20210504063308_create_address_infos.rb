class CreateAddressInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :address_infos do |t|

      t.timestamps
    end
  end
end
