class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.integer :college_id
      t.integer :major_id
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :univ, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
