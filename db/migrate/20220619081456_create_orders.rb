class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :name
      t.string :postal_code
      t.integer :payment_method, default: 0
      t.integer :production_status, default: 0
      t.integer :delivery_charge
      t.integer :billing_amount

      t.timestamps
    end
  end
end
