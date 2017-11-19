class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_company
      t.string :card_number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
