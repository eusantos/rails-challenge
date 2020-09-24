class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false, null: false
      t.integer :amount, null: false
      t.string :currency, default: "usd", null: false
      t.boolean :refunded, default: false, null: false
      t.references :customer, null: false, foreign_key: true
      t.boolean :disputed, default: false, null: false

      t.timestamps
    end
  end
end
