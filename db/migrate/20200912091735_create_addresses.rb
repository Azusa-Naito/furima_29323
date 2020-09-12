class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :from,          null: false
      t.string     :city,          null: false
      t.string     :block_number,  null: false
      t.string     :apartment_name
      t.string     :phone_number,  null: false
      t.references :purchase,      null: false, foreign_key: true 
      t.timestamps
    end
  end
end
