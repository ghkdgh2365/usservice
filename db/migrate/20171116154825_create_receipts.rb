class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :category
      t.datetime :pay_date
      t.integer :amount
      t.string :content
      t.text :detail_content
      t.text :extra
      t.string :bill
      t.string :cash
      t.references :user, index: true, foreign_key: true
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
