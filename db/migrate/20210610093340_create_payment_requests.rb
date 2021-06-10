class CreatePaymentRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_requests do |t|
      t.decimal :amount
      t.string :currency
      t.text :description
      t.integer :state, default: 0
      t.timestamps
    end
  end
end
