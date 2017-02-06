class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :reference
      t.jsonb :items, default: {}, null: false

      t.timestamps
    end
  end
end
