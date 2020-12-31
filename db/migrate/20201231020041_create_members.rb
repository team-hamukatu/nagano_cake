class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :kana_last_name, null: false
      t.string :kana_first_name, null: false
      t.string :postal_code, null: false
      t.string :street_address, null: false
      t.string :phone_number, null: false
      t.boolean :is_active, :boolean, default: true, null: false

      t.timestamps
    end
  end
end
