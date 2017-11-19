class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :college_name
      t.references :univ, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
