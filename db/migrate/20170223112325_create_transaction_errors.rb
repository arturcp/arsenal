class CreateTransactionErrors < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :notification_code
      t.jsonb :params, default: {}, null: false
      t.jsonb :errors, default: {}, null: false
      t.jsonb :transaction, default: {}, null: false

      t.timestamps
    end
  end
end
